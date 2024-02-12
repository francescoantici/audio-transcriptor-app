import 'dart:typed_data';

import 'package:audio_transcriptor_app/domain/model/audio_record/audiorecord.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final audioRecordsProvider = FutureProvider<List<AudioRecord>>((ref) async {
  final repo = ref.watch(audioRepositoryProvider);
  return repo.getAudioRecords();
});

final audioRepositoryProvider = Provider<AudioRecordRepository>((ref) {
  return AudioRecordRepository();
});

class AudioRecordRepository {
  Future<List<AudioRecord>> getAudioRecords() async {
    return Future.value([]);
  }

  Future<void> uploadAudioRecord(Uint8List bytes) async {
    return Future.value();
  }
}
