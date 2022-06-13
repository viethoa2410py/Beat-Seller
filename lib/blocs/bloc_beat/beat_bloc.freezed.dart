// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel beat) uploadBeat,
    required TResult Function(UploadStatus status) changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BeatModel beat)? uploadBeat,
    TResult Function(UploadStatus status)? changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel beat)? uploadBeat,
    TResult Function(UploadStatus status)? changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadBeat value) uploadBeat,
    required TResult Function(ChangeStatus value) changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UploadBeat value)? uploadBeat,
    TResult Function(ChangeStatus value)? changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadBeat value)? uploadBeat,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeatEventCopyWith<$Res> {
  factory $BeatEventCopyWith(BeatEvent value, $Res Function(BeatEvent) then) =
      _$BeatEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BeatEventCopyWithImpl<$Res> implements $BeatEventCopyWith<$Res> {
  _$BeatEventCopyWithImpl(this._value, this._then);

  final BeatEvent _value;
  // ignore: unused_field
  final $Res Function(BeatEvent) _then;
}

/// @nodoc
abstract class _$$UploadBeatCopyWith<$Res> {
  factory _$$UploadBeatCopyWith(
          _$UploadBeat value, $Res Function(_$UploadBeat) then) =
      __$$UploadBeatCopyWithImpl<$Res>;
  $Res call({BeatModel beat});
}

/// @nodoc
class __$$UploadBeatCopyWithImpl<$Res> extends _$BeatEventCopyWithImpl<$Res>
    implements _$$UploadBeatCopyWith<$Res> {
  __$$UploadBeatCopyWithImpl(
      _$UploadBeat _value, $Res Function(_$UploadBeat) _then)
      : super(_value, (v) => _then(v as _$UploadBeat));

  @override
  _$UploadBeat get _value => super._value as _$UploadBeat;

  @override
  $Res call({
    Object? beat = freezed,
  }) {
    return _then(_$UploadBeat(
      beat == freezed
          ? _value.beat
          : beat // ignore: cast_nullable_to_non_nullable
              as BeatModel,
    ));
  }
}

/// @nodoc

class _$UploadBeat implements UploadBeat {
  const _$UploadBeat(this.beat);

  @override
  final BeatModel beat;

  @override
  String toString() {
    return 'BeatEvent.uploadBeat(beat: $beat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadBeat &&
            const DeepCollectionEquality().equals(other.beat, beat));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(beat));

  @JsonKey(ignore: true)
  @override
  _$$UploadBeatCopyWith<_$UploadBeat> get copyWith =>
      __$$UploadBeatCopyWithImpl<_$UploadBeat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel beat) uploadBeat,
    required TResult Function(UploadStatus status) changeStatus,
  }) {
    return uploadBeat(beat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BeatModel beat)? uploadBeat,
    TResult Function(UploadStatus status)? changeStatus,
  }) {
    return uploadBeat?.call(beat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel beat)? uploadBeat,
    TResult Function(UploadStatus status)? changeStatus,
    required TResult orElse(),
  }) {
    if (uploadBeat != null) {
      return uploadBeat(beat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadBeat value) uploadBeat,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return uploadBeat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UploadBeat value)? uploadBeat,
    TResult Function(ChangeStatus value)? changeStatus,
  }) {
    return uploadBeat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadBeat value)? uploadBeat,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (uploadBeat != null) {
      return uploadBeat(this);
    }
    return orElse();
  }
}

abstract class UploadBeat implements BeatEvent {
  const factory UploadBeat(final BeatModel beat) = _$UploadBeat;

  BeatModel get beat => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UploadBeatCopyWith<_$UploadBeat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeStatusCopyWith<$Res> {
  factory _$$ChangeStatusCopyWith(
          _$ChangeStatus value, $Res Function(_$ChangeStatus) then) =
      __$$ChangeStatusCopyWithImpl<$Res>;
  $Res call({UploadStatus status});
}

/// @nodoc
class __$$ChangeStatusCopyWithImpl<$Res> extends _$BeatEventCopyWithImpl<$Res>
    implements _$$ChangeStatusCopyWith<$Res> {
  __$$ChangeStatusCopyWithImpl(
      _$ChangeStatus _value, $Res Function(_$ChangeStatus) _then)
      : super(_value, (v) => _then(v as _$ChangeStatus));

  @override
  _$ChangeStatus get _value => super._value as _$ChangeStatus;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$ChangeStatus(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UploadStatus,
    ));
  }
}

/// @nodoc

class _$ChangeStatus implements ChangeStatus {
  const _$ChangeStatus(this.status);

  @override
  final UploadStatus status;

  @override
  String toString() {
    return 'BeatEvent.changeStatus(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStatus &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$ChangeStatusCopyWith<_$ChangeStatus> get copyWith =>
      __$$ChangeStatusCopyWithImpl<_$ChangeStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel beat) uploadBeat,
    required TResult Function(UploadStatus status) changeStatus,
  }) {
    return changeStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BeatModel beat)? uploadBeat,
    TResult Function(UploadStatus status)? changeStatus,
  }) {
    return changeStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel beat)? uploadBeat,
    TResult Function(UploadStatus status)? changeStatus,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadBeat value) uploadBeat,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return changeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UploadBeat value)? uploadBeat,
    TResult Function(ChangeStatus value)? changeStatus,
  }) {
    return changeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadBeat value)? uploadBeat,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus(this);
    }
    return orElse();
  }
}

abstract class ChangeStatus implements BeatEvent {
  const factory ChangeStatus(final UploadStatus status) = _$ChangeStatus;

  UploadStatus get status => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ChangeStatusCopyWith<_$ChangeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeatState {
  UploadStatus get uploadStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeatStateCopyWith<BeatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeatStateCopyWith<$Res> {
  factory $BeatStateCopyWith(BeatState value, $Res Function(BeatState) then) =
      _$BeatStateCopyWithImpl<$Res>;
  $Res call({UploadStatus uploadStatus});
}

/// @nodoc
class _$BeatStateCopyWithImpl<$Res> implements $BeatStateCopyWith<$Res> {
  _$BeatStateCopyWithImpl(this._value, this._then);

  final BeatState _value;
  // ignore: unused_field
  final $Res Function(BeatState) _then;

  @override
  $Res call({
    Object? uploadStatus = freezed,
  }) {
    return _then(_value.copyWith(
      uploadStatus: uploadStatus == freezed
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as UploadStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_BeatStateCopyWith<$Res> implements $BeatStateCopyWith<$Res> {
  factory _$$_BeatStateCopyWith(
          _$_BeatState value, $Res Function(_$_BeatState) then) =
      __$$_BeatStateCopyWithImpl<$Res>;
  @override
  $Res call({UploadStatus uploadStatus});
}

/// @nodoc
class __$$_BeatStateCopyWithImpl<$Res> extends _$BeatStateCopyWithImpl<$Res>
    implements _$$_BeatStateCopyWith<$Res> {
  __$$_BeatStateCopyWithImpl(
      _$_BeatState _value, $Res Function(_$_BeatState) _then)
      : super(_value, (v) => _then(v as _$_BeatState));

  @override
  _$_BeatState get _value => super._value as _$_BeatState;

  @override
  $Res call({
    Object? uploadStatus = freezed,
  }) {
    return _then(_$_BeatState(
      uploadStatus: uploadStatus == freezed
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as UploadStatus,
    ));
  }
}

/// @nodoc

class _$_BeatState implements _BeatState {
  const _$_BeatState({this.uploadStatus = UploadStatus.idle});

  @override
  @JsonKey()
  final UploadStatus uploadStatus;

  @override
  String toString() {
    return 'BeatState(uploadStatus: $uploadStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeatState &&
            const DeepCollectionEquality()
                .equals(other.uploadStatus, uploadStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(uploadStatus));

  @JsonKey(ignore: true)
  @override
  _$$_BeatStateCopyWith<_$_BeatState> get copyWith =>
      __$$_BeatStateCopyWithImpl<_$_BeatState>(this, _$identity);
}

abstract class _BeatState implements BeatState {
  const factory _BeatState({final UploadStatus uploadStatus}) = _$_BeatState;

  @override
  UploadStatus get uploadStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BeatStateCopyWith<_$_BeatState> get copyWith =>
      throw _privateConstructorUsedError;
}
