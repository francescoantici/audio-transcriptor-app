import 'package:audio_transcriptor_app/domain/repository/audio_record_repository.dart';
import 'package:audio_transcriptor_app/utils/logger/logger_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final uploadAudioUseCaseProvider = Provider<UploadAudioUseCase>((ref) {
  return UploadAudioUseCase(
    repository: ref.read(audioRepositoryProvider),
    logger: ref.read(loggerManagerProvider),
  );
});

class UploadAudioUseCase {
  UploadAudioUseCase({
    required this.repository,
    required this.logger,
  });

  final AudioRecordRepository repository;
  final LoggerManager logger;

  Future<void> perform() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result == null) return Future.value();
    final files = result.files;
    if (files.isEmpty) return Future.value();
    final fileBytes = files.first.bytes;
    if (fileBytes == null) return Future.value();
    logger.logMessage('Uploading audio record: ${files.first.name}');
    return repository.uploadAudioRecord(fileBytes);
  }
}
