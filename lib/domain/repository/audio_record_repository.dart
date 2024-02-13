import 'dart:async';

import 'package:audio_transcriptor_app/domain/model/audio_record/audiorecord.dart';
import 'package:audio_transcriptor_app/domain/repository/dio_provider.dart';
import 'package:audio_transcriptor_app/utils/env.dart';
import 'package:audio_transcriptor_app/utils/logger/logger_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  Future<List<AudioRecord>> fetchValues();
}

class ApiAudioRecordRepository extends IAudioRecordRepository {
  ApiAudioRecordRepository({
    required this.dio,
    required this.logger,
  });

  final Dio dio;
  final LoggerManager logger;

  final _audioRecords = <AudioRecord>[];

  @override
  Future<void> uploadAudioRecord(Uint8List bytes, {required String filename}) async {
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
    _audioRecords.add(parsed);
    return Future.value();
  }

  @override
  Future<List<AudioRecord>> fetchValues() {
    logger.logMessage('Fetching audio records');
    final values = [..._audioRecords];
    return Future.value(values);
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

  @override
  Future<void> uploadAudioRecord(Uint8List bytes, {required String filename}) async {
    final mock = AudioRecord(
      keywords: ['ciao', 'come', 'stai'],
      originalText: 'Ciao come stai?',
      sourceLanguage: 'it',
      targetLanguage: 'en',
      translatedText: 'Hello how are you?',
    );
    _audioRecords.add(mock);
    return Future.value();
  }

  @override
  Future<List<AudioRecord>> fetchValues() {
    logger.logMessage('Fetching audio records');
    final values = [..._audioRecords];
    return Future.value(values);
  }
}
