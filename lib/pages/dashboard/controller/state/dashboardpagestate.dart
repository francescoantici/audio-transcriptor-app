import 'package:audio_transcriptor_app/domain/model/audio_record/audiorecord.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboardpagestate.freezed.dart';

@freezed
class DashboardPageState with _$DashboardPageState {
  factory DashboardPageState.loaded({
    required List<AudioRecord> records,
  }) = Loaded;

  factory DashboardPageState.loading() = Loading;
}
