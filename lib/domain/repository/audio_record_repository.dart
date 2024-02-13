import 'dart:async';

import 'package:audio_transcriptor_app/domain/model/audio_record/audiorecord.dart';
import 'package:audio_transcriptor_app/domain/repository/dio_provider.dart';
import 'package:audio_transcriptor_app/utils/env.dart';
import 'package:audio_transcriptor_app/utils/logger/logger_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final audioRecordsProvider = StreamProvider<List<AudioRecord>>((ref) {
  final repo = ref.watch(audioRepositoryProvider);
  ref.onAddListener(repo.fetchValues);
  return repo.audioRecordsStream;
});

final audioRepositoryProvider = Provider<IAudioRecordRepository>((ref) {
  final dio = ref.read(dioProvider);
  final logger = ref.read(loggerManagerProvider);
  if (AppEnv.isDevEnv) {
    return MockAudioRecordRepository(
      logger: logger,
    );
  }
  return ApiAudioRecordRepository(
    dio: dio,
    logger: logger,
  );
});

abstract class IAudioRecordRepository {
  Future<void> uploadAudioRecord(Uint8List bytes, {required String filename});
  Stream<List<AudioRecord>> get audioRecordsStream;
  Future<void> fetchValues();
}

class ApiAudioRecordRepository extends IAudioRecordRepository {
  ApiAudioRecordRepository({
    required this.dio,
    required this.logger,
  });

  final Dio dio;
  final LoggerManager logger;

  final _audioRecords = <AudioRecord>[];

  final audioRecordsController = StreamController<List<AudioRecord>>.broadcast();

  @override
  Stream<List<AudioRecord>> get audioRecordsStream => audioRecordsController.stream;

  @override
  Future<void> uploadAudioRecord(Uint8List bytes, {required String filename}) async {
    try {
      final multipartFile = MultipartFile.fromBytes(bytes, filename: filename);
      final form = FormData.fromMap({
        'audio_file': multipartFile,
      });
      final response = await dio.post<Map<String, dynamic>>(
        AppEnv.apiUri,
        data: form,
      );
      final data = response.data;
      final parsed = AudioRecord.fromJson(data!);
      final values = [..._audioRecords, parsed];
      _audioRecords.add(parsed);
      audioRecordsController.add(values);
      return Future.value();
    } on DioException catch (e) {
      logger.logExeption(e);
      return Future.value();
    } catch (e) {
      return Future.value();
    }
  }

  @override
  Future<void> fetchValues() {
    logger.logMessage('Fetching audio records');
    final values = [..._audioRecords];
    audioRecordsController.add(values);
    return Future.value();
  }
}

class MockAudioRecordRepository extends IAudioRecordRepository {
  MockAudioRecordRepository({
    required this.logger,
  });

  final LoggerManager logger;

  final _audioRecords = <AudioRecord>[
    AudioRecord(
      keywords: ['ciao', 'come', 'stai'],
      originalText: 'Ciao come stai?',
      sourceLanguage: 'it',
      targetLanguage: 'en',
      translatedText: 'Hello how are you?',
    ),
  ];

  final audioRecordsController = StreamController<List<AudioRecord>>.broadcast();

  @override
  Stream<List<AudioRecord>> get audioRecordsStream => audioRecordsController.stream;

  @override
  Future<void> uploadAudioRecord(Uint8List bytes, {required String filename}) async {
    final mock = AudioRecord(
      keywords: ['ciao', 'come', 'stai'],
      originalText: 'Ciao come stai?',
      sourceLanguage: 'it',
      targetLanguage: 'en',
      translatedText: 'Hello how are you?',
    );
    final values = [..._audioRecords, mock];
    _audioRecords.add(mock);
    audioRecordsController.add(values);
    return Future.value();
  }

  @override
  Future<void> fetchValues() {
    logger.logMessage('Fetching audio records');
    final values = [..._audioRecords];
    audioRecordsController.add(values);
    return Future.value();
  }
}
