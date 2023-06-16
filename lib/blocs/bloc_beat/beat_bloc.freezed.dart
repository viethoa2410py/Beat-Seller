// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(BeatModel beat) editBeat,
    required TResult Function(BeatModel beat) uploadBeat,
    required TResult Function(UploadStatus status) changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeatModel beat)? editBeat,
    TResult? Function(BeatModel beat)? uploadBeat,
    TResult? Function(UploadStatus status)? changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel beat)? editBeat,
    TResult Function(BeatModel beat)? uploadBeat,
    TResult Function(UploadStatus status)? changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditBeat value) editBeat,
    required TResult Function(UploadBeat value) uploadBeat,
    required TResult Function(ChangeStatus value) changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditBeat value)? editBeat,
    TResult? Function(UploadBeat value)? uploadBeat,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditBeat value)? editBeat,
    TResult Function(UploadBeat value)? uploadBeat,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeatEventCopyWith<$Res> {
  factory $BeatEventCopyWith(BeatEvent value, $Res Function(BeatEvent) then) =
      _$BeatEventCopyWithImpl<$Res, BeatEvent>;
}

/// @nodoc
class _$BeatEventCopyWithImpl<$Res, $Val extends BeatEvent>
    implements $BeatEventCopyWith<$Res> {
  _$BeatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EditBeatCopyWith<$Res> {
  factory _$$EditBeatCopyWith(
          _$EditBeat value, $Res Function(_$EditBeat) then) =
      __$$EditBeatCopyWithImpl<$Res>;
  @useResult
  $Res call({BeatModel beat});
}

/// @nodoc
class __$$EditBeatCopyWithImpl<$Res>
    extends _$BeatEventCopyWithImpl<$Res, _$EditBeat>
    implements _$$EditBeatCopyWith<$Res> {
  __$$EditBeatCopyWithImpl(_$EditBeat _value, $Res Function(_$EditBeat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beat = null,
  }) {
    return _then(_$EditBeat(
      null == beat
          ? _value.beat
          : beat // ignore: cast_nullable_to_non_nullable
              as BeatModel,
    ));
  }
}

/// @nodoc

class _$EditBeat implements EditBeat {
  const _$EditBeat(this.beat);

  @override
  final BeatModel beat;

  @override
  String toString() {
    return 'BeatEvent.editBeat(beat: $beat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditBeat &&
            (identical(other.beat, beat) || other.beat == beat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditBeatCopyWith<_$EditBeat> get copyWith =>
      __$$EditBeatCopyWithImpl<_$EditBeat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel beat) editBeat,
    required TResult Function(BeatModel beat) uploadBeat,
    required TResult Function(UploadStatus status) changeStatus,
  }) {
    return editBeat(beat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeatModel beat)? editBeat,
    TResult? Function(BeatModel beat)? uploadBeat,
    TResult? Function(UploadStatus status)? changeStatus,
  }) {
    return editBeat?.call(beat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel beat)? editBeat,
    TResult Function(BeatModel beat)? uploadBeat,
    TResult Function(UploadStatus status)? changeStatus,
    required TResult orElse(),
  }) {
    if (editBeat != null) {
      return editBeat(beat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditBeat value) editBeat,
    required TResult Function(UploadBeat value) uploadBeat,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return editBeat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditBeat value)? editBeat,
    TResult? Function(UploadBeat value)? uploadBeat,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return editBeat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditBeat value)? editBeat,
    TResult Function(UploadBeat value)? uploadBeat,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (editBeat != null) {
      return editBeat(this);
    }
    return orElse();
  }
}

abstract class EditBeat implements BeatEvent {
  const factory EditBeat(final BeatModel beat) = _$EditBeat;

  BeatModel get beat;
  @JsonKey(ignore: true)
  _$$EditBeatCopyWith<_$EditBeat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadBeatCopyWith<$Res> {
  factory _$$UploadBeatCopyWith(
          _$UploadBeat value, $Res Function(_$UploadBeat) then) =
      __$$UploadBeatCopyWithImpl<$Res>;
  @useResult
  $Res call({BeatModel beat});
}

/// @nodoc
class __$$UploadBeatCopyWithImpl<$Res>
    extends _$BeatEventCopyWithImpl<$Res, _$UploadBeat>
    implements _$$UploadBeatCopyWith<$Res> {
  __$$UploadBeatCopyWithImpl(
      _$UploadBeat _value, $Res Function(_$UploadBeat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beat = null,
  }) {
    return _then(_$UploadBeat(
      null == beat
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
            (identical(other.beat, beat) || other.beat == beat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadBeatCopyWith<_$UploadBeat> get copyWith =>
      __$$UploadBeatCopyWithImpl<_$UploadBeat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel beat) editBeat,
    required TResult Function(BeatModel beat) uploadBeat,
    required TResult Function(UploadStatus status) changeStatus,
  }) {
    return uploadBeat(beat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeatModel beat)? editBeat,
    TResult? Function(BeatModel beat)? uploadBeat,
    TResult? Function(UploadStatus status)? changeStatus,
  }) {
    return uploadBeat?.call(beat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel beat)? editBeat,
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
    required TResult Function(EditBeat value) editBeat,
    required TResult Function(UploadBeat value) uploadBeat,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return uploadBeat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditBeat value)? editBeat,
    TResult? Function(UploadBeat value)? uploadBeat,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return uploadBeat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditBeat value)? editBeat,
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

  BeatModel get beat;
  @JsonKey(ignore: true)
  _$$UploadBeatCopyWith<_$UploadBeat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeStatusCopyWith<$Res> {
  factory _$$ChangeStatusCopyWith(
          _$ChangeStatus value, $Res Function(_$ChangeStatus) then) =
      __$$ChangeStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({UploadStatus status});
}

/// @nodoc
class __$$ChangeStatusCopyWithImpl<$Res>
    extends _$BeatEventCopyWithImpl<$Res, _$ChangeStatus>
    implements _$$ChangeStatusCopyWith<$Res> {
  __$$ChangeStatusCopyWithImpl(
      _$ChangeStatus _value, $Res Function(_$ChangeStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$ChangeStatus(
      null == status
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
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeStatusCopyWith<_$ChangeStatus> get copyWith =>
      __$$ChangeStatusCopyWithImpl<_$ChangeStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel beat) editBeat,
    required TResult Function(BeatModel beat) uploadBeat,
    required TResult Function(UploadStatus status) changeStatus,
  }) {
    return changeStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeatModel beat)? editBeat,
    TResult? Function(BeatModel beat)? uploadBeat,
    TResult? Function(UploadStatus status)? changeStatus,
  }) {
    return changeStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel beat)? editBeat,
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
    required TResult Function(EditBeat value) editBeat,
    required TResult Function(UploadBeat value) uploadBeat,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return changeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditBeat value)? editBeat,
    TResult? Function(UploadBeat value)? uploadBeat,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return changeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditBeat value)? editBeat,
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

  UploadStatus get status;
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
      _$BeatStateCopyWithImpl<$Res, BeatState>;
  @useResult
  $Res call({UploadStatus uploadStatus});
}

/// @nodoc
class _$BeatStateCopyWithImpl<$Res, $Val extends BeatState>
    implements $BeatStateCopyWith<$Res> {
  _$BeatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadStatus = null,
  }) {
    return _then(_value.copyWith(
      uploadStatus: null == uploadStatus
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as UploadStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeatStateCopyWith<$Res> implements $BeatStateCopyWith<$Res> {
  factory _$$_BeatStateCopyWith(
          _$_BeatState value, $Res Function(_$_BeatState) then) =
      __$$_BeatStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UploadStatus uploadStatus});
}

/// @nodoc
class __$$_BeatStateCopyWithImpl<$Res>
    extends _$BeatStateCopyWithImpl<$Res, _$_BeatState>
    implements _$$_BeatStateCopyWith<$Res> {
  __$$_BeatStateCopyWithImpl(
      _$_BeatState _value, $Res Function(_$_BeatState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadStatus = null,
  }) {
    return _then(_$_BeatState(
      uploadStatus: null == uploadStatus
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
            (identical(other.uploadStatus, uploadStatus) ||
                other.uploadStatus == uploadStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uploadStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeatStateCopyWith<_$_BeatState> get copyWith =>
      __$$_BeatStateCopyWithImpl<_$_BeatState>(this, _$identity);
}

abstract class _BeatState implements BeatState {
  const factory _BeatState({final UploadStatus uploadStatus}) = _$_BeatState;

  @override
  UploadStatus get uploadStatus;
  @override
  @JsonKey(ignore: true)
  _$$_BeatStateCopyWith<_$_BeatState> get copyWith =>
      throw _privateConstructorUsedError;
}
