import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotel_booking/models/model.dart';
import 'package:hotel_booking/repository/repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<LoadData>(_loadData);
    on<AddToCart>(_addToCart);
    on<DeleteInCart>(_deleteInCart);
  }
  _loadData(LoadData event, Emitter<CartState> emit) async {
    var list = await BeatRepository.getMyCart(UserRepository.currentUser!.id);
    emit(state.copyWith(beats: list));
  }

  _addToCart(AddToCart event, Emitter<CartState> emit) async {
    await BeatRepository.addToCart(UserRepository.currentUser!.id, event.beat);

    var list = await BeatRepository.getMyCart(UserRepository.currentUser!.id);
    emit(state.copyWith(beats: list));
  }

  _deleteInCart(DeleteInCart event, Emitter<CartState> emit) async {}
}
