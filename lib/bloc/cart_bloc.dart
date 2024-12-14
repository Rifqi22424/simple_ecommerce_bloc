import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadCart>(
      (event, emit) async {
        await Future.delayed(const Duration(seconds: 1));
        emit(const CartLoaded(cart: <Product>[]));
      },
    );
    on<ClearCart>(
      (event, emit) async {
        emit(const CartLoaded(cart: <Product>[]));
      },
    );
    on<AddToCart>(
      (event, emit) {
        if (state is CartLoaded) {
          final state = this.state as CartLoaded;
          final cart = List<Product>.from(state.cart);
          final productIndex = cart.indexWhere((p) => p.id == event.product.id);

          if (productIndex != -1) {
            final existingProduct = cart[productIndex];
            cart[productIndex] = existingProduct.copyWith(
                quantity: existingProduct.quantity + 1);
          } else {
            cart.add(event.product);
          }

          emit(CartLoaded(cart: cart));
        }
      },
    );
    on<RemoveFromCart>(
      (event, emit) {
        if (state is CartLoaded) {
          final state = this.state as CartLoaded;
          final cart = List<Product>.from(state.cart);
          final productIndex = cart.indexWhere((p) => p.id == event.product.id);

          if (productIndex != -1) {
            final existingProduct = cart[productIndex];
            if (existingProduct.quantity > 1) {
              cart[productIndex] = existingProduct.copyWith(
                  quantity: existingProduct.quantity - 1);
            } else {
              cart.remove(event.product);
            }
          }

          emit(CartLoaded(cart: cart));
        }
      },
    );
  }
}
