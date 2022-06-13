// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    TResult Function(BeatModel audio)? initial,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(AudioState state)? changeStateAudio,
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
    TResult Function(InitialAudio value)? initial,
    TResult Function(PlayAudio value)? play,
    TResult Function(PauseAudio value)? pause,
    TResult Function(ChangeStateAudio value)? changeStateAudio,
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
      _$AudioPlayerEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AudioPlayerEventCopyWithImpl<$Res>
    implements $AudioPlayerEventCopyWith<$Res> {
  _$AudioPlayerEventCopyWithImpl(this._value, this._then);

  final AudioPlayerEvent _value;
  // ignore: unused_field
  final $Res Function(AudioPlayerEvent) _then;
}

/// @nodoc
abstract class _$$InitialAudioCopyWith<$Res> {
  factory _$$InitialAudioCopyWith(
          _$InitialAudio value, $Res Function(_$InitialAudio) then) =
      __$$InitialAudioCopyWithImpl<$Res>;
  $Res call({BeatModel audio});
}

/// @nodoc
class __$$InitialAudioCopyWithImpl<$Res>
    extends _$AudioPlayerEventCopyWithImpl<$Res>
    implements _$$InitialAudioCopyWith<$Res> {
  __$$InitialAudioCopyWithImpl(
      _$InitialAudio _value, $Res Function(_$InitialAudio) _then)
      : super(_value, (v) => _then(v as _$InitialAudio));

  @override
  _$InitialAudio get _value => super._value as _$InitialAudio;

  @override
  $Res call({
    Object? audio = freezed,
  }) {
    return _then(_$InitialAudio(
      audio == freezed
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
            const DeepCollectionEquality().equals(other.audio, audio));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(audio));

  @JsonKey(ignore: true)
  @override
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
    TResult Function(BeatModel audio)? initial,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(AudioState state)? changeStateAudio,
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
    TResult Function(InitialAudio value)? initial,
    TResult Function(PlayAudio value)? play,
    TResult Function(PauseAudio value)? pause,
    TResult Function(ChangeStateAudio value)? changeStateAudio,
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

  BeatModel get audio => throw _privateConstructorUsedError;
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
    extends _$AudioPlayerEventCopyWithImpl<$Res>
    implements _$$PlayAudioCopyWith<$Res> {
  __$$PlayAudioCopyWithImpl(
      _$PlayAudio _value, $Res Function(_$PlayAudio) _then)
      : super(_value, (v) => _then(v as _$PlayAudio));

  @override
  _$PlayAudio get _value => super._value as _$PlayAudio;
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
    TResult Function(BeatModel audio)? initial,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(AudioState state)? changeStateAudio,
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
    TResult Function(InitialAudio value)? initial,
    TResult Function(PlayAudio value)? play,
    TResult Function(PauseAudio value)? pause,
    TResult Function(ChangeStateAudio value)? changeStateAudio,
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
    extends _$AudioPlayerEventCopyWithImpl<$Res>
    implements _$$PauseAudioCopyWith<$Res> {
  __$$PauseAudioCopyWithImpl(
      _$PauseAudio _value, $Res Function(_$PauseAudio) _then)
      : super(_value, (v) => _then(v as _$PauseAudio));

  @override
  _$PauseAudio get _value => super._value as _$PauseAudio;
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
    TResult Function(BeatModel audio)? initial,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(AudioState state)? changeStateAudio,
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
    TResult Function(InitialAudio value)? initial,
    TResult Function(PlayAudio value)? play,
    TResult Function(PauseAudio value)? pause,
    TResult Function(ChangeStateAudio value)? changeStateAudio,
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
  $Res call({AudioState state});
}

/// @nodoc
class __$$ChangeStateAudioCopyWithImpl<$Res>
    extends _$AudioPlayerEventCopyWithImpl<$Res>
    implements _$$ChangeStateAudioCopyWith<$Res> {
  __$$ChangeStateAudioCopyWithImpl(
      _$ChangeStateAudio _value, $Res Function(_$ChangeStateAudio) _then)
      : super(_value, (v) => _then(v as _$ChangeStateAudio));

  @override
  _$ChangeStateAudio get _value => super._value as _$ChangeStateAudio;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_$ChangeStateAudio(
      state == freezed
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
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
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
    TResult Function(BeatModel audio)? initial,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(AudioState state)? changeStateAudio,
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
    TResult Function(InitialAudio value)? initial,
    TResult Function(PlayAudio value)? play,
    TResult Function(PauseAudio value)? pause,
    TResult Function(ChangeStateAudio value)? changeStateAudio,
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

  AudioState get state => throw _privateConstructorUsedError;
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
      _$AudioPlayerStateCopyWithImpl<$Res>;
  $Res call({AudioState audioState, BeatModel? currentSound});
}

/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._value, this._then);

  final AudioPlayerState _value;
  // ignore: unused_field
  final $Res Function(AudioPlayerState) _then;

  @override
  $Res call({
    Object? audioState = freezed,
    Object? currentSound = freezed,
  }) {
    return _then(_value.copyWith(
      audioState: audioState == freezed
          ? _value.audioState
          : audioState // ignore: cast_nullable_to_non_nullable
              as AudioState,
      currentSound: currentSound == freezed
          ? _value.currentSound
          : currentSound // ignore: cast_nullable_to_non_nullable
              as BeatModel?,
    ));
  }
}

/// @nodoc
abstract class _$$_AudioPlayerStateCopyWith<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  factory _$$_AudioPlayerStateCopyWith(
          _$_AudioPlayerState value, $Res Function(_$_AudioPlayerState) then) =
      __$$_AudioPlayerStateCopyWithImpl<$Res>;
  @override
  $Res call({AudioState audioState, BeatModel? currentSound});
}

/// @nodoc
class __$$_AudioPlayerStateCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res>
    implements _$$_AudioPlayerStateCopyWith<$Res> {
  __$$_AudioPlayerStateCopyWithImpl(
      _$_AudioPlayerState _value, $Res Function(_$_AudioPlayerState) _then)
      : super(_value, (v) => _then(v as _$_AudioPlayerState));

  @override
  _$_AudioPlayerState get _value => super._value as _$_AudioPlayerState;

  @override
  $Res call({
    Object? audioState = freezed,
    Object? currentSound = freezed,
  }) {
    return _then(_$_AudioPlayerState(
      audioState: audioState == freezed
          ? _value.audioState
          : audioState // ignore: cast_nullable_to_non_nullable
              as AudioState,
      currentSound: currentSound == freezed
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
            const DeepCollectionEquality()
                .equals(other.audioState, audioState) &&
            const DeepCollectionEquality()
                .equals(other.currentSound, currentSound));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(audioState),
      const DeepCollectionEquality().hash(currentSound));

  @JsonKey(ignore: true)
  @override
  _$$_AudioPlayerStateCopyWith<_$_AudioPlayerState> get copyWith =>
      __$$_AudioPlayerStateCopyWithImpl<_$_AudioPlayerState>(this, _$identity);
}

abstract class _AudioPlayerState extends AudioPlayerState {
  const factory _AudioPlayerState(
      {final AudioState audioState,
      final BeatModel? currentSound}) = _$_AudioPlayerState;
  const _AudioPlayerState._() : super._();

  @override
  AudioState get audioState => throw _privateConstructorUsedError;
  @override
  BeatModel? get currentSound => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AudioPlayerStateCopyWith<_$_AudioPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
