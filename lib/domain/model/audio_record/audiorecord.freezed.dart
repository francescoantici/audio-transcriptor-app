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
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioRecordCopyWith<$Res> {
  factory $AudioRecordCopyWith(
          AudioRecord value, $Res Function(AudioRecord) then) =
      _$AudioRecordCopyWithImpl<$Res, AudioRecord>;
}

/// @nodoc
class _$AudioRecordCopyWithImpl<$Res, $Val extends AudioRecord>
    implements $AudioRecordCopyWith<$Res> {
  _$AudioRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AudioRecordImplCopyWith<$Res> {
  factory _$$AudioRecordImplCopyWith(
          _$AudioRecordImpl value, $Res Function(_$AudioRecordImpl) then) =
      __$$AudioRecordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AudioRecordImplCopyWithImpl<$Res>
    extends _$AudioRecordCopyWithImpl<$Res, _$AudioRecordImpl>
    implements _$$AudioRecordImplCopyWith<$Res> {
  __$$AudioRecordImplCopyWithImpl(
      _$AudioRecordImpl _value, $Res Function(_$AudioRecordImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AudioRecordImpl implements _AudioRecord {
  _$AudioRecordImpl();

  factory _$AudioRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioRecordImplFromJson(json);

  @override
  String toString() {
    return 'AudioRecord()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AudioRecordImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioRecordImplToJson(
      this,
    );
  }
}

abstract class _AudioRecord implements AudioRecord {
  factory _AudioRecord() = _$AudioRecordImpl;

  factory _AudioRecord.fromJson(Map<String, dynamic> json) =
      _$AudioRecordImpl.fromJson;
}