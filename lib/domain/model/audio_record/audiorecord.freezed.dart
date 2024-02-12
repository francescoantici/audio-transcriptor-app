// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audiorecord.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AudioRecord _$AudioRecordFromJson(Map<String, dynamic> json) {
  return _AudioRecord.fromJson(json);
}

/// @nodoc
mixin _$AudioRecord {
  List<String> get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_text')
  String get originalText => throw _privateConstructorUsedError;
  @JsonKey(name: 'translated_text')
  String get translatedText => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_language')
  String get sourceLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_language')
  String get targetLanguage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioRecordCopyWith<AudioRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioRecordCopyWith<$Res> {
  factory $AudioRecordCopyWith(
          AudioRecord value, $Res Function(AudioRecord) then) =
      _$AudioRecordCopyWithImpl<$Res, AudioRecord>;
  @useResult
  $Res call(
      {List<String> keywords,
      @JsonKey(name: 'original_text') String originalText,
      @JsonKey(name: 'translated_text') String translatedText,
      @JsonKey(name: 'source_language') String sourceLanguage,
      @JsonKey(name: 'target_language') String targetLanguage});
}

/// @nodoc
class _$AudioRecordCopyWithImpl<$Res, $Val extends AudioRecord>
    implements $AudioRecordCopyWith<$Res> {
  _$AudioRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keywords = null,
    Object? originalText = null,
    Object? translatedText = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
  }) {
    return _then(_value.copyWith(
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      translatedText: null == translatedText
          ? _value.translatedText
          : translatedText // ignore: cast_nullable_to_non_nullable
              as String,
      sourceLanguage: null == sourceLanguage
          ? _value.sourceLanguage
          : sourceLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      targetLanguage: null == targetLanguage
          ? _value.targetLanguage
          : targetLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioRecordImplCopyWith<$Res>
    implements $AudioRecordCopyWith<$Res> {
  factory _$$AudioRecordImplCopyWith(
          _$AudioRecordImpl value, $Res Function(_$AudioRecordImpl) then) =
      __$$AudioRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> keywords,
      @JsonKey(name: 'original_text') String originalText,
      @JsonKey(name: 'translated_text') String translatedText,
      @JsonKey(name: 'source_language') String sourceLanguage,
      @JsonKey(name: 'target_language') String targetLanguage});
}

/// @nodoc
class __$$AudioRecordImplCopyWithImpl<$Res>
    extends _$AudioRecordCopyWithImpl<$Res, _$AudioRecordImpl>
    implements _$$AudioRecordImplCopyWith<$Res> {
  __$$AudioRecordImplCopyWithImpl(
      _$AudioRecordImpl _value, $Res Function(_$AudioRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keywords = null,
    Object? originalText = null,
    Object? translatedText = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
  }) {
    return _then(_$AudioRecordImpl(
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      translatedText: null == translatedText
          ? _value.translatedText
          : translatedText // ignore: cast_nullable_to_non_nullable
              as String,
      sourceLanguage: null == sourceLanguage
          ? _value.sourceLanguage
          : sourceLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      targetLanguage: null == targetLanguage
          ? _value.targetLanguage
          : targetLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioRecordImpl implements _AudioRecord {
  _$AudioRecordImpl(
      {required final List<String> keywords,
      @JsonKey(name: 'original_text') required this.originalText,
      @JsonKey(name: 'translated_text') required this.translatedText,
      @JsonKey(name: 'source_language') required this.sourceLanguage,
      @JsonKey(name: 'target_language') required this.targetLanguage})
      : _keywords = keywords;

  factory _$AudioRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioRecordImplFromJson(json);

  final List<String> _keywords;
  @override
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  @JsonKey(name: 'original_text')
  final String originalText;
  @override
  @JsonKey(name: 'translated_text')
  final String translatedText;
  @override
  @JsonKey(name: 'source_language')
  final String sourceLanguage;
  @override
  @JsonKey(name: 'target_language')
  final String targetLanguage;

  @override
  String toString() {
    return 'AudioRecord(keywords: $keywords, originalText: $originalText, translatedText: $translatedText, sourceLanguage: $sourceLanguage, targetLanguage: $targetLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioRecordImpl &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText) &&
            (identical(other.translatedText, translatedText) ||
                other.translatedText == translatedText) &&
            (identical(other.sourceLanguage, sourceLanguage) ||
                other.sourceLanguage == sourceLanguage) &&
            (identical(other.targetLanguage, targetLanguage) ||
                other.targetLanguage == targetLanguage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_keywords),
      originalText,
      translatedText,
      sourceLanguage,
      targetLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioRecordImplCopyWith<_$AudioRecordImpl> get copyWith =>
      __$$AudioRecordImplCopyWithImpl<_$AudioRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioRecordImplToJson(
      this,
    );
  }
}

abstract class _AudioRecord implements AudioRecord {
  factory _AudioRecord(
      {required final List<String> keywords,
      @JsonKey(name: 'original_text') required final String originalText,
      @JsonKey(name: 'translated_text') required final String translatedText,
      @JsonKey(name: 'source_language') required final String sourceLanguage,
      @JsonKey(name: 'target_language')
      required final String targetLanguage}) = _$AudioRecordImpl;

  factory _AudioRecord.fromJson(Map<String, dynamic> json) =
      _$AudioRecordImpl.fromJson;

  @override
  List<String> get keywords;
  @override
  @JsonKey(name: 'original_text')
  String get originalText;
  @override
  @JsonKey(name: 'translated_text')
  String get translatedText;
  @override
  @JsonKey(name: 'source_language')
  String get sourceLanguage;
  @override
  @JsonKey(name: 'target_language')
  String get targetLanguage;
  @override
  @JsonKey(ignore: true)
  _$$AudioRecordImplCopyWith<_$AudioRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
