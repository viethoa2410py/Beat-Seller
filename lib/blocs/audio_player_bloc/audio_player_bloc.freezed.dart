// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioPlayerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel audio) initial,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(AudioState state) changeStateAudio,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeatModel audio)? initial,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(AudioState state)? changeStateAudio,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel audio)? initial,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(AudioState state)? changeStateAudio,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAudio value) initial,
    required TResult Function(PlayAudio value) play,
    required TResult Function(PauseAudio value) pause,
    required TResult Function(ChangeStateAudio value) changeStateAudio,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudio value)? initial,
    TResult? Function(PlayAudio value)? play,
    TResult? Function(PauseAudio value)? pause,
    TResult? Function(ChangeStateAudio value)? changeStateAudio,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudio value)? initial,
    TResult Function(PlayAudio value)? play,
    TResult Function(PauseAudio value)? pause,
    TResult Function(ChangeStateAudio value)? changeStateAudio,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerEventCopyWith<$Res> {
  factory $AudioPlayerEventCopyWith(
          AudioPlayerEvent value, $Res Function(AudioPlayerEvent) then) =
      _$AudioPlayerEventCopyWithImpl<$Res, AudioPlayerEvent>;
}

/// @nodoc
class _$AudioPlayerEventCopyWithImpl<$Res, $Val extends AudioPlayerEvent>
    implements $AudioPlayerEventCopyWith<$Res> {
  _$AudioPlayerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialAudioCopyWith<$Res> {
  factory _$$InitialAudioCopyWith(
          _$InitialAudio value, $Res Function(_$InitialAudio) then) =
      __$$InitialAudioCopyWithImpl<$Res>;
  @useResult
  $Res call({BeatModel audio});
}

/// @nodoc
class __$$InitialAudioCopyWithImpl<$Res>
    extends _$AudioPlayerEventCopyWithImpl<$Res, _$InitialAudio>
    implements _$$InitialAudioCopyWith<$Res> {
  __$$InitialAudioCopyWithImpl(
      _$InitialAudio _value, $Res Function(_$InitialAudio) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = null,
  }) {
    return _then(_$InitialAudio(
      null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as BeatModel,
    ));
  }
}

/// @nodoc

class _$InitialAudio implements InitialAudio {
  const _$InitialAudio(this.audio);

  @override
  final BeatModel audio;

  @override
  String toString() {
    return 'AudioPlayerEvent.initial(audio: $audio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialAudio &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialAudioCopyWith<_$InitialAudio> get copyWith =>
      __$$InitialAudioCopyWithImpl<_$InitialAudio>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel audio) initial,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(AudioState state) changeStateAudio,
  }) {
    return initial(audio);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeatModel audio)? initial,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(AudioState state)? changeStateAudio,
  }) {
    return initial?.call(audio);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel audio)? initial,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(AudioState state)? changeStateAudio,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(audio);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAudio value) initial,
    required TResult Function(PlayAudio value) play,
    required TResult Function(PauseAudio value) pause,
    required TResult Function(ChangeStateAudio value) changeStateAudio,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudio value)? initial,
    TResult? Function(PlayAudio value)? play,
    TResult? Function(PauseAudio value)? pause,
    TResult? Function(ChangeStateAudio value)? changeStateAudio,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudio value)? initial,
    TResult Function(PlayAudio value)? play,
    TResult Function(PauseAudio value)? pause,
    TResult Function(ChangeStateAudio value)? changeStateAudio,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialAudio implements AudioPlayerEvent {
  const factory InitialAudio(final BeatModel audio) = _$InitialAudio;

  BeatModel get audio;
  @JsonKey(ignore: true)
  _$$InitialAudioCopyWith<_$InitialAudio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayAudioCopyWith<$Res> {
  factory _$$PlayAudioCopyWith(
          _$PlayAudio value, $Res Function(_$PlayAudio) then) =
      __$$PlayAudioCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayAudioCopyWithImpl<$Res>
    extends _$AudioPlayerEventCopyWithImpl<$Res, _$PlayAudio>
    implements _$$PlayAudioCopyWith<$Res> {
  __$$PlayAudioCopyWithImpl(
      _$PlayAudio _value, $Res Function(_$PlayAudio) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlayAudio implements PlayAudio {
  const _$PlayAudio();

  @override
  String toString() {
    return 'AudioPlayerEvent.play()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlayAudio);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel audio) initial,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(AudioState state) changeStateAudio,
  }) {
    return play();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeatModel audio)? initial,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(AudioState state)? changeStateAudio,
  }) {
    return play?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel audio)? initial,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(AudioState state)? changeStateAudio,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAudio value) initial,
    required TResult Function(PlayAudio value) play,
    required TResult Function(PauseAudio value) pause,
    required TResult Function(ChangeStateAudio value) changeStateAudio,
  }) {
    return play(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudio value)? initial,
    TResult? Function(PlayAudio value)? play,
    TResult? Function(PauseAudio value)? pause,
    TResult? Function(ChangeStateAudio value)? changeStateAudio,
  }) {
    return play?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudio value)? initial,
    TResult Function(PlayAudio value)? play,
    TResult Function(PauseAudio value)? pause,
    TResult Function(ChangeStateAudio value)? changeStateAudio,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play(this);
    }
    return orElse();
  }
}

abstract class PlayAudio implements AudioPlayerEvent {
  const factory PlayAudio() = _$PlayAudio;
}

/// @nodoc
abstract class _$$PauseAudioCopyWith<$Res> {
  factory _$$PauseAudioCopyWith(
          _$PauseAudio value, $Res Function(_$PauseAudio) then) =
      __$$PauseAudioCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseAudioCopyWithImpl<$Res>
    extends _$AudioPlayerEventCopyWithImpl<$Res, _$PauseAudio>
    implements _$$PauseAudioCopyWith<$Res> {
  __$$PauseAudioCopyWithImpl(
      _$PauseAudio _value, $Res Function(_$PauseAudio) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PauseAudio implements PauseAudio {
  const _$PauseAudio();

  @override
  String toString() {
    return 'AudioPlayerEvent.pause()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PauseAudio);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel audio) initial,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(AudioState state) changeStateAudio,
  }) {
    return pause();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeatModel audio)? initial,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(AudioState state)? changeStateAudio,
  }) {
    return pause?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel audio)? initial,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(AudioState state)? changeStateAudio,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAudio value) initial,
    required TResult Function(PlayAudio value) play,
    required TResult Function(PauseAudio value) pause,
    required TResult Function(ChangeStateAudio value) changeStateAudio,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudio value)? initial,
    TResult? Function(PlayAudio value)? play,
    TResult? Function(PauseAudio value)? pause,
    TResult? Function(ChangeStateAudio value)? changeStateAudio,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudio value)? initial,
    TResult Function(PlayAudio value)? play,
    TResult Function(PauseAudio value)? pause,
    TResult Function(ChangeStateAudio value)? changeStateAudio,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }
}

abstract class PauseAudio implements AudioPlayerEvent {
  const factory PauseAudio() = _$PauseAudio;
}

/// @nodoc
abstract class _$$ChangeStateAudioCopyWith<$Res> {
  factory _$$ChangeStateAudioCopyWith(
          _$ChangeStateAudio value, $Res Function(_$ChangeStateAudio) then) =
      __$$ChangeStateAudioCopyWithImpl<$Res>;
  @useResult
  $Res call({AudioState state});
}

/// @nodoc
class __$$ChangeStateAudioCopyWithImpl<$Res>
    extends _$AudioPlayerEventCopyWithImpl<$Res, _$ChangeStateAudio>
    implements _$$ChangeStateAudioCopyWith<$Res> {
  __$$ChangeStateAudioCopyWithImpl(
      _$ChangeStateAudio _value, $Res Function(_$ChangeStateAudio) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$ChangeStateAudio(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as AudioState,
    ));
  }
}

/// @nodoc

class _$ChangeStateAudio implements ChangeStateAudio {
  const _$ChangeStateAudio(this.state);

  @override
  final AudioState state;

  @override
  String toString() {
    return 'AudioPlayerEvent.changeStateAudio(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStateAudio &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeStateAudioCopyWith<_$ChangeStateAudio> get copyWith =>
      __$$ChangeStateAudioCopyWithImpl<_$ChangeStateAudio>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeatModel audio) initial,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(AudioState state) changeStateAudio,
  }) {
    return changeStateAudio(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeatModel audio)? initial,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(AudioState state)? changeStateAudio,
  }) {
    return changeStateAudio?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeatModel audio)? initial,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(AudioState state)? changeStateAudio,
    required TResult orElse(),
  }) {
    if (changeStateAudio != null) {
      return changeStateAudio(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAudio value) initial,
    required TResult Function(PlayAudio value) play,
    required TResult Function(PauseAudio value) pause,
    required TResult Function(ChangeStateAudio value) changeStateAudio,
  }) {
    return changeStateAudio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAudio value)? initial,
    TResult? Function(PlayAudio value)? play,
    TResult? Function(PauseAudio value)? pause,
    TResult? Function(ChangeStateAudio value)? changeStateAudio,
  }) {
    return changeStateAudio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAudio value)? initial,
    TResult Function(PlayAudio value)? play,
    TResult Function(PauseAudio value)? pause,
    TResult Function(ChangeStateAudio value)? changeStateAudio,
    required TResult orElse(),
  }) {
    if (changeStateAudio != null) {
      return changeStateAudio(this);
    }
    return orElse();
  }
}

abstract class ChangeStateAudio implements AudioPlayerEvent {
  const factory ChangeStateAudio(final AudioState state) = _$ChangeStateAudio;

  AudioState get state;
  @JsonKey(ignore: true)
  _$$ChangeStateAudioCopyWith<_$ChangeStateAudio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AudioPlayerState {
  AudioState get audioState => throw _privateConstructorUsedError;
  BeatModel? get currentSound => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioPlayerStateCopyWith<AudioPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerStateCopyWith<$Res> {
  factory $AudioPlayerStateCopyWith(
          AudioPlayerState value, $Res Function(AudioPlayerState) then) =
      _$AudioPlayerStateCopyWithImpl<$Res, AudioPlayerState>;
  @useResult
  $Res call({AudioState audioState, BeatModel? currentSound});
}

/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res, $Val extends AudioPlayerState>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioState = null,
    Object? currentSound = freezed,
  }) {
    return _then(_value.copyWith(
      audioState: null == audioState
          ? _value.audioState
          : audioState // ignore: cast_nullable_to_non_nullable
              as AudioState,
      currentSound: freezed == currentSound
          ? _value.currentSound
          : currentSound // ignore: cast_nullable_to_non_nullable
              as BeatModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AudioPlayerStateCopyWith<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  factory _$$_AudioPlayerStateCopyWith(
          _$_AudioPlayerState value, $Res Function(_$_AudioPlayerState) then) =
      __$$_AudioPlayerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AudioState audioState, BeatModel? currentSound});
}

/// @nodoc
class __$$_AudioPlayerStateCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$_AudioPlayerState>
    implements _$$_AudioPlayerStateCopyWith<$Res> {
  __$$_AudioPlayerStateCopyWithImpl(
      _$_AudioPlayerState _value, $Res Function(_$_AudioPlayerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioState = null,
    Object? currentSound = freezed,
  }) {
    return _then(_$_AudioPlayerState(
      audioState: null == audioState
          ? _value.audioState
          : audioState // ignore: cast_nullable_to_non_nullable
              as AudioState,
      currentSound: freezed == currentSound
          ? _value.currentSound
          : currentSound // ignore: cast_nullable_to_non_nullable
              as BeatModel?,
    ));
  }
}

/// @nodoc

class _$_AudioPlayerState extends _AudioPlayerState {
  const _$_AudioPlayerState(
      {this.audioState = AudioState.loading, this.currentSound})
      : super._();

  @override
  @JsonKey()
  final AudioState audioState;
  @override
  final BeatModel? currentSound;

  @override
  String toString() {
    return 'AudioPlayerState(audioState: $audioState, currentSound: $currentSound)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioPlayerState &&
            (identical(other.audioState, audioState) ||
                other.audioState == audioState) &&
            (identical(other.currentSound, currentSound) ||
                other.currentSound == currentSound));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioState, currentSound);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioPlayerStateCopyWith<_$_AudioPlayerState> get copyWith =>
      __$$_AudioPlayerStateCopyWithImpl<_$_AudioPlayerState>(this, _$identity);
}

abstract class _AudioPlayerState extends AudioPlayerState {
  const factory _AudioPlayerState(
      {final AudioState audioState,
      final BeatModel? currentSound}) = _$_AudioPlayerState;
  const _AudioPlayerState._() : super._();

  @override
  AudioState get audioState;
  @override
  BeatModel? get currentSound;
  @override
  @JsonKey(ignore: true)
  _$$_AudioPlayerStateCopyWith<_$_AudioPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
