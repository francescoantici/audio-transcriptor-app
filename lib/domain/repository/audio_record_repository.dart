import 'dart:async';
import 'dart:typed_data';

import 'package:audio_transcriptor_app/domain/model/audio_record/audiorecord.dart';
import 'package:audio_transcriptor_app/domain/repository/dio_provider.dart';
import 'package:audio_transcriptor_app/utils/logger/logger_manager.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final audioRecordsProvider = StreamProvider<List<AudioRecord>>((ref) {
  final repo = ref.watch(audioRepositoryProvider);
  ref.onAddListener(repo.fetchValues);
  return repo.audioRecordsStream;
});

final audioRepositoryProvider = Provider<AudioRecordRepository>((ref) {
  return AudioRecordRepository(
    dio: ref.read(dioProvider),
    logger: ref.read(loggerManagerProvider),
  );
});

class AudioRecordRepository {
  AudioRecordRepository({
    required this.dio,
    required this.logger,
  });

  final Dio dio;
  final LoggerManager logger;

  final String path = 'https://api.audio-transcriptor.com/records';

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

  Stream<List<AudioRecord>> get audioRecordsStream => audioRecordsController.stream;

  Future<void> uploadAudioRecord(Uint8List bytes, {required String filename}) async {
    /* final multipartFile = MultipartFile.fromBytes(bytes, filename: filename);
    final form = FormData.fromMap({
      'file': multipartFile,
    });
    final response = await dio.post<AudioRecord>(
      path,
      data: form,
    ); */
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

  void fetchValues() {
    logger.logMessage('Fetching audio records');
    final values = [..._audioRecords];
    audioRecordsController.add(values);
  }
}
