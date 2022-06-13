part of 'beat_bloc.dart';

@freezed
class BeatState with _$BeatState {
  const factory BeatState(
      {@Default(UploadStatus.idle) UploadStatus uploadStatus}) = _BeatState;
  factory BeatState.initial() => BeatState();
}

enum UploadStatus { idle, loading, complete, error }
