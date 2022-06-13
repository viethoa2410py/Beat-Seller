part of 'audio_player_bloc.dart';

@freezed
class AudioPlayerEvent with _$AudioPlayerEvent {

  const factory AudioPlayerEvent.initial(BeatModel audio,
      ) = InitialAudio;

  const factory AudioPlayerEvent.play() = PlayAudio;
  const factory AudioPlayerEvent.pause() = PauseAudio;

  const factory AudioPlayerEvent.changeStateAudio(AudioState state) =
      ChangeStateAudio;
}