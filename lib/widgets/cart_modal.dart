import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../consts/app_styles.dart';
import 'thanks_dialog.dart';

class CartModal extends StatelessWidget {
  const CartModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartInitial) {
          return const CircularProgressIndicator(
            color: Colors.blue,
          );
        }

        if (state is CartLoaded) {
          return Column(
            children: [
              const SizedBox(height: 10),
              if (state.cart.isEmpty)
                const Expanded(
                    child: Center(
                        child: Text("Please order in advance",
                            style: AppStyles.paragraph)))
              else
                Expanded(
                  child: ListView(
                    children: state.cart
                        .map(
                          (product) => ListTile(
                            onTap: () {},
                            leading: SizedBox(
                                height: 100, width: 100, child: product.image),
                            title: Text(product.name, style: AppStyles.h6),
                            subtitle: Row(
                              children: [
                                Text('\$${product.totalPrice}',
                                    style: AppStyles.paragraph),
                                const SizedBox(width: 20),
                                Text('qty: ${product.quantity.toString()}',
                                    style: AppStyles.paragraph)
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () => context
                                    .read<CartBloc>()
                                    .add(RemoveFromCart(product: product)),
                                icon: const Icon(Icons.remove_circle)),
                          ),
                        )
                        .toList(),
                  ),
                ),
              const SizedBox(height: 10),
              if (state.allTotalPrice > 0.0)
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size((MediaQuery.of(context).size.width - 10), 50),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () => showThanksDialog(context: context),
                    child: Text(
                      'Checkout \$${state.allTotalPrice.toString()}',
                      style: const TextStyle(color: Colors.white),
                    )),
              const SizedBox(height: 10),
            ],
          );
        }
        return const Center(child: Text("Cart is empty"));
      },
    );
  }

  showThanksDialog({required BuildContext context}) {
    // Bersihkan keranjang
    context.read<CartBloc>().add(ClearCart());

    // Tutup modal sebelumnya

    Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pop();

    Future.delayed(const Duration(seconds: 1));

    // Tampilkan AlertDialog baru
    showDialog(
      context: context,
      builder: (context) {
        return const ThanksDialog();
      },
    );
  }
}
