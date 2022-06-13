part of 'audio_player_bloc.dart';

@freezed
class AudioPlayerState with _$AudioPlayerState {
  const AudioPlayerState._();
  const factory AudioPlayerState({
    @Default(AudioState.loading) AudioState audioState,

    BeatModel? currentSound,
  }) = _AudioPlayerState;
  factory AudioPlayerState.initial() => AudioPlayerState(
  
      );
}

enum AudioState { idle, loading, pause, playing, update, error }

