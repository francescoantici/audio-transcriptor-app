import 'package:freezed_annotation/freezed_annotation.dart';

part 'audiorecord.freezed.dart';
part 'audiorecord.g.dart';

@freezed
class AudioRecord with _$AudioRecord {
  factory AudioRecord({
    required List<String> keywords,
    @JsonKey(name: 'original_text') required String originalText,
    @JsonKey(name: 'translated_text') required String translatedText,
    @JsonKey(name: 'source_language') required String sourceLanguage,
    @JsonKey(name: 'target_language') required String targetLanguage,
  }) = _AudioRecord;

  factory AudioRecord.fromJson(Map<String, dynamic> json) => _$AudioRecordFromJson(json);
}
