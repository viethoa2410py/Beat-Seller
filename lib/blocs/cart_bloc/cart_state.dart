part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<BeatModel> beats,
  }) = _CartState;
  factory CartState.initial() => CartState();
}
