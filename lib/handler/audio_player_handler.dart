import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:beatSeller/models/model.dart';

import 'package:just_audio/just_audio.dart';

class AudioPlayerHandler extends BaseAudioHandler {
  static final AudioPlayerHandler _instance = AudioPlayerHandler._internal();
  static final AudioPlayer player = AudioPlayer();

  factory AudioPlayerHandler() {
    return _instance;
  }
  AudioPlayerHandler._internal();

  final ErrorStream errorController = ErrorStream();

  Future setUrl(BeatModel sound) async {
    try {
      await player.setUrl(sound.thumbnail.audio);
      errorController.seValueError(false);
    } catch (e) {
      errorController.seValueError(true);
    }
  }

  @override
  Future<void> play() => player.play();

  @override
  Future<void> pause() => player.pause();

  @override
  Future<void> seek(Duration position) => player.seek(position);
  @override
  Future<void> stop() async {
    await seek(Duration.zero);
    await player.pause();
  }

  @override
  Future customAction(String name, [Map<String, dynamic>? extras]) async {
    if (name == 'dispose') {
      await player.dispose();
      super.stop();
    } else if (name == 'setVolume') {
      player.setVolume(extras!["volume"]);
    }
  }

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    switch (repeatMode) {
      case AudioServiceRepeatMode.none:
        player.setLoopMode(LoopMode.off);
        break;
      case AudioServiceRepeatMode.one:
        player.setLoopMode(LoopMode.one);
        break;
      case AudioServiceRepeatMode.group:
      case AudioServiceRepeatMode.all:
        player.setLoopMode(LoopMode.all);
        break;
    }
  }
}

class ErrorStream {
  bool isError = false;
  String message = '';
  StreamController streamController = StreamController<bool>.broadcast();
  Stream get stream => streamController.stream;

  void seValueError(value) {
    isError = value;
    streamController.sink.add(isError);
  }

  void dispose() {
    streamController.close();
  }
}
