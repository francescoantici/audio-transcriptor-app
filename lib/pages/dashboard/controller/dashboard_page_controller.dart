import 'dart:typed_data';

import 'package:audio_transcriptor_app/domain/model/audio_record/audiorecord.dart';
import 'package:audio_transcriptor_app/domain/repository/audio_record_repository.dart';
import 'package:audio_transcriptor_app/pages/dashboard/controller/state/dashboardpagestate.dart';
import 'package:audio_transcriptor_app/utils/dialog/dialog_manager.dart';
import 'package:audio_transcriptor_app/utils/logger/logger_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dashboardPageControllerProvider = StateNotifierProvider<DashboardPageController, DashboardPageState>((ref) {
  final recordRepository = ref.read(audioRepositoryProvider);
  final dialogManager = ref.read(dialogManagerProvider);
  final logger = ref.read(loggerManagerProvider);
  return DashboardPageController(
    recordRepository: recordRepository,
    dialogManager: dialogManager,
    logger: logger,
  );
});

class DashboardPageController extends StateNotifier<DashboardPageState> {
  DashboardPageController({
    required this.recordRepository,
    required this.dialogManager,
    required this.logger,
  }) : super(DashboardPageState.loading()) {
    _init();
  }

  final IAudioRecordRepository recordRepository;
  final DialogManager dialogManager;
  final LoggerManager logger;

  Future<void> _init() async {
    try {
      final records = await recordRepository.fetchValues();
      state = DashboardPageState.loaded(records: records);
    } catch (e) {
      state = DashboardPageState.loaded(records: <AudioRecord>[]);
      return dialogManager.showWarningDialog<void>(text: 'Errore nel caricamento');
    }
  }

  Future<void> _uploadAudioRecord(Uint8List bytes, {required String filename}) async {
    final loaded = state.mapOrNull(loaded: (value) => value.records);
    if (loaded == null) return Future.value();
    try {
      state = DashboardPageState.loading();
      await recordRepository.uploadAudioRecord(bytes, filename: filename);
      final records = await recordRepository.fetchValues();
      state = DashboardPageState.loaded(records: records);
    } catch (e) {
      state = DashboardPageState.loaded(records: [...loaded]);
      return dialogManager.showWarningDialog<void>(text: 'Errore nel caricamento');
    }
  }

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result == null) return Future.value();
    final files = result.files;
    if (files.isEmpty) return Future.value();
    final file = files.first;
    final bytes = file.bytes;
    if (bytes == null) return Future.value();
    logger.logMessage('Uploading audio record: ${files.first.name}');
    return _uploadAudioRecord(bytes, filename: file.name);
  }
}
