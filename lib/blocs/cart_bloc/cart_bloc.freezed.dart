// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(BeatModel beat) addToCart,
    required TResult Function(BeatModel beat) deleteInCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(BeatModel beat)? addToCart,
    TResult? Function(BeatModel beat)? deleteInCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(BeatModel beat)? addToCart,
    TResult Function(BeatModel beat)? deleteInCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(DeleteInCart value) deleteInCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(DeleteInCart value)? deleteInCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(DeleteInCart value)? deleteInCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadDataCopyWith<$Res> {
  factory _$$LoadDataCopyWith(
          _$LoadData value, $Res Function(_$LoadData) then) =
      __$$LoadDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadDataCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$LoadData>
    implements _$$LoadDataCopyWith<$Res> {
  __$$LoadDataCopyWithImpl(_$LoadData _value, $Res Function(_$LoadData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadData implements LoadData {
  const _$LoadData();

  @override
  String toString() {
    return 'CartEvent.loadData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(BeatModel beat) addToCart,
    required TResult Function(BeatModel beat) deleteInCart,
  }) {
    return loadData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(BeatModel beat)? addToCart,
    TResult? Function(BeatModel beat)? deleteInCart,
  }) {
    return loadData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(BeatModel beat)? addToCart,
    TResult Function(BeatModel beat)? deleteInCart,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(DeleteInCart value) deleteInCart,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(DeleteInCart value)? deleteInCart,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(DeleteInCart value)? deleteInCart,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class LoadData implements CartEvent {
  const factory LoadData() = _$LoadData;
}

/// @nodoc
abstract class _$$AddToCartCopyWith<$Res> {
  factory _$$AddToCartCopyWith(
          _$AddToCart value, $Res Function(_$AddToCart) then) =
      __$$AddToCartCopyWithImpl<$Res>;
  @useResult
  $Res call({BeatModel beat});
}

/// @nodoc
class __$$AddToCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddToCart>
    implements _$$AddToCartCopyWith<$Res> {
  __$$AddToCartCopyWithImpl(
      _$AddToCart _value, $Res Function(_$AddToCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beat = null,
  }) {
    return _then(_$AddToCart(
      null == beat
          ? _value.beat
          : beat // ignore: cast_nullable_to_non_nullable
              as BeatModel,
    ));
  }
}

/// @nodoc

class _$AddToCart implements AddToCart {
  const _$AddToCart(this.beat);

  @override
  final BeatModel beat;

  @override
  String toString() {
    return 'CartEvent.addToCart(beat: $beat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCart &&
            (identical(other.beat, beat) || other.beat == beat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartCopyWith<_$AddToCart> get copyWith =>
      __$$AddToCartCopyWithImpl<_$AddToCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(BeatModel beat) addToCart,
    required TResult Function(BeatModel beat) deleteInCart,
  }) {
    return addToCart(beat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(BeatModel beat)? addToCart,
    TResult? Function(BeatModel beat)? deleteInCart,
  }) {
    return addToCart?.call(beat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(BeatModel beat)? addToCart,
    TResult Function(BeatModel beat)? deleteInCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(beat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(DeleteInCart value) deleteInCart,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(DeleteInCart value)? deleteInCart,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(DeleteInCart value)? deleteInCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class AddToCart implements CartEvent {
  const factory AddToCart(final BeatModel beat) = _$AddToCart;

  BeatModel get beat;
  @JsonKey(ignore: true)
  _$$AddToCartCopyWith<_$AddToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteInCartCopyWith<$Res> {
  factory _$$DeleteInCartCopyWith(
          _$DeleteInCart value, $Res Function(_$DeleteInCart) then) =
      __$$DeleteInCartCopyWithImpl<$Res>;
  @useResult
  $Res call({BeatModel beat});
}

/// @nodoc
class __$$DeleteInCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$DeleteInCart>
    implements _$$DeleteInCartCopyWith<$Res> {
  __$$DeleteInCartCopyWithImpl(
      _$DeleteInCart _value, $Res Function(_$DeleteInCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beat = null,
  }) {
    return _then(_$DeleteInCart(
      null == beat
          ? _value.beat
          : beat // ignore: cast_nullable_to_non_nullable
              as BeatModel,
    ));
  }
}

/// @nodoc

class _$DeleteInCart implements DeleteInCart {
  const _$DeleteInCart(this.beat);

  @override
  final BeatModel beat;

  @override
  String toString() {
    return 'CartEvent.deleteInCart(beat: $beat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteInCart &&
            (identical(other.beat, beat) || other.beat == beat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteInCartCopyWith<_$DeleteInCart> get copyWith =>
      __$$DeleteInCartCopyWithImpl<_$DeleteInCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(BeatModel beat) addToCart,
    required TResult Function(BeatModel beat) deleteInCart,
  }) {
    return deleteInCart(beat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(BeatModel beat)? addToCart,
    TResult? Function(BeatModel beat)? deleteInCart,
  }) {
    return deleteInCart?.call(beat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(BeatModel beat)? addToCart,
    TResult Function(BeatModel beat)? deleteInCart,
    required TResult orElse(),
  }) {
    if (deleteInCart != null) {
      return deleteInCart(beat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadData value) loadData,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(DeleteInCart value) deleteInCart,
  }) {
    return deleteInCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadData value)? loadData,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(DeleteInCart value)? deleteInCart,
  }) {
    return deleteInCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadData value)? loadData,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(DeleteInCart value)? deleteInCart,
    required TResult orElse(),
  }) {
    if (deleteInCart != null) {
      return deleteInCart(this);
    }
    return orElse();
  }
}

abstract class DeleteInCart implements CartEvent {
  const factory DeleteInCart(final BeatModel beat) = _$DeleteInCart;

  BeatModel get beat;
  @JsonKey(ignore: true)
  _$$DeleteInCartCopyWith<_$DeleteInCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  List<BeatModel> get beats => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call({List<BeatModel> beats});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beats = null,
  }) {
    return _then(_value.copyWith(
      beats: null == beats
          ? _value.beats
          : beats // ignore: cast_nullable_to_non_nullable
              as List<BeatModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$$_CartStateCopyWith(
          _$_CartState value, $Res Function(_$_CartState) then) =
      __$$_CartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BeatModel> beats});
}

/// @nodoc
class __$$_CartStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_CartState>
    implements _$$_CartStateCopyWith<$Res> {
  __$$_CartStateCopyWithImpl(
      _$_CartState _value, $Res Function(_$_CartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beats = null,
  }) {
    return _then(_$_CartState(
      beats: null == beats
          ? _value._beats
          : beats // ignore: cast_nullable_to_non_nullable
              as List<BeatModel>,
    ));
  }
}

/// @nodoc

class _$_CartState implements _CartState {
  const _$_CartState({final List<BeatModel> beats = const []}) : _beats = beats;

  final List<BeatModel> _beats;
  @override
  @JsonKey()
  List<BeatModel> get beats {
    if (_beats is EqualUnmodifiableListView) return _beats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beats);
  }

  @override
  String toString() {
    return 'CartState(beats: $beats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            const DeepCollectionEquality().equals(other._beats, _beats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_beats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState({final List<BeatModel> beats}) = _$_CartState;

  @override
  List<BeatModel> get beats;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
