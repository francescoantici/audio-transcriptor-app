import 'package:freezed_annotation/freezed_annotation.dart';

part 'audiorecord.freezed.dart';
part 'audiorecord.g.dart';

@freezed
class AudioRecord with _$AudioRecord {
  factory AudioRecord() = _AudioRecord;

  factory AudioRecord.fromJson(Map<String, dynamic> json) => _$AudioRecordFromJson(json);
}
