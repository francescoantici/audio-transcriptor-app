// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audiorecord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioRecordImpl _$$AudioRecordImplFromJson(Map<String, dynamic> json) =>
    _$AudioRecordImpl(
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      originalText: json['original_text'] as String,
      translatedText: json['translated_text'] as String,
      sourceLanguage: json['source_language'] as String,
      targetLanguage: json['target_language'] as String,
    );

Map<String, dynamic> _$$AudioRecordImplToJson(_$AudioRecordImpl instance) =>
    <String, dynamic>{
      'keywords': instance.keywords,
      'original_text': instance.originalText,
      'translated_text': instance.translatedText,
      'source_language': instance.sourceLanguage,
      'target_language': instance.targetLanguage,
    };
