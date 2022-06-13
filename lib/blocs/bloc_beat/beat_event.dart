part of 'beat_bloc.dart';

@freezed
class BeatEvent with _$BeatEvent {
  const factory BeatEvent.uploadBeat(BeatModel beat) = UploadBeat;
   const factory BeatEvent.changeStatus(UploadStatus status) = ChangeStatus;
}
