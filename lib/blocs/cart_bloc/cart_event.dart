part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.loadData() = LoadData;
  const factory CartEvent.addToCart(BeatModel beat) = AddToCart;
  const factory CartEvent.deleteInCart(BeatModel beat) = DeleteInCart;
}
