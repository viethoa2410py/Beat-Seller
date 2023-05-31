import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:beatSeller/handler/audio_player_handler.dart';
import 'package:beatSeller/models/model.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';
part 'audio_player_bloc.freezed.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  AudioPlayerBloc() : super(AudioPlayerState.initial()) {
    _mapEventToState();
  }
  void _mapEventToState() {
    on<InitialAudio>(_initialAudioState);
    on<PlayAudio>((event, emit) {
      AudioPlayerHandler().play();
    });
    on<PauseAudio>((event, emit) {
      AudioPlayerHandler().pause();
    });
    on<ChangeStateAudio>((event, emit) {
      emit(state.copyWith(audioState: event.state));
    });
  }

  _initialAudioState(InitialAudio event, Emitter<AudioPlayerState> emit) async {
    try {
      add(const ChangeStateAudio(AudioState.loading));
      AudioPlayerHandler().setUrl(event.audio);
      _listenAudioChanged();
      emit(state.copyWith(
          audioState: AudioState.pause, currentSound: event.audio));
    } catch (e) {}
  }

  _listenAudioChanged() {
    AudioPlayerHandler.player.playerStateStream.listen((playState) {
      final isPlaying = playState.playing;

      final processingState = playState.processingState;
      switch (processingState) {
        case ProcessingState.loading:
        case ProcessingState.buffering:
          add(const ChangeStateAudio(AudioState.loading));
          break;
        case ProcessingState.idle:
          add(const ChangeStateAudio(AudioState.pause));
          break;
        case ProcessingState.ready:
          if (!isPlaying) {
            if (state.audioState != AudioState.pause) {
              add(const ChangeStateAudio(AudioState.pause));
            }
          } else {
            if (state.audioState != AudioState.playing) {
              add(const ChangeStateAudio(AudioState.playing));
            }
          }
          break;
        case ProcessingState.completed:
          break;
      }
    });
  }
}
