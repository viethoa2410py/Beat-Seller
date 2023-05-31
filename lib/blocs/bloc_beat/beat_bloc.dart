import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:beatSeller/models/model.dart';
import 'package:beatSeller/repository/repository.dart';

part 'beat_event.dart';
part 'beat_state.dart';
part 'beat_bloc.freezed.dart';

class BeatBloc extends Bloc<BeatEvent, BeatState> {
  BeatBloc() : super(BeatState.initial()) {
    on<UploadBeat>(_updateBeat);
    on<ChangeStatus>(_changeStatus);
  }

  _updateBeat(UploadBeat event, Emitter<BeatState> emit) async {
    try {
      emit(state.copyWith(uploadStatus: UploadStatus.loading));
      await BeatRepository.uploadBeat(event.beat);
      emit(state.copyWith(uploadStatus: UploadStatus.complete));
    } catch (e) {
      emit(state.copyWith(uploadStatus: UploadStatus.error));
    }
    emit(state.copyWith(uploadStatus: UploadStatus.idle));
  }

  _changeStatus(ChangeStatus event, Emitter<BeatState> emit) async {
    emit(state.copyWith(uploadStatus: event.status));
    emit(state.copyWith(uploadStatus: UploadStatus.idle));
  }
}
