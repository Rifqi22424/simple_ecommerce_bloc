part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<Product> cart;

  const CartLoaded({required this.cart});

  double get allTotalPrice => cart.fold(
      0, (total, product) => total + (product.totalPrice));

  @override
  List<Object> get props => [cart];
}
