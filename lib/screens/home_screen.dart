import 'package:e_commerce_simple_bloc/bloc/cart_bloc.dart';
import 'package:e_commerce_simple_bloc/widgets/cart_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../consts/app_styles.dart';
import '../widgets/responsive_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("E-Commerce App", style: AppStyles.h2),
        centerTitle: true,
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoaded && state.cart.isNotEmpty) {
                return IconButton(
                    onPressed: () => showCartModal(context: context),
                    icon: Stack(
                      children: [
                        const Icon(Icons.shopping_cart),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red[700],
                              ),
                              width: 15,
                              height: 15,
                              child: Center(
                                  child: Text(
                                state.cart.length.toString(),
                                style: const TextStyle(
                                    fontSize: 10,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ))),
                        ),
                      ],
                    ));
              } else {
                return IconButton(
                    onPressed: () => showCartModal(context: context),
                    icon: const Icon(Icons.shopping_cart));
              }
            },
          ),
        ],
      ),
      // body: ResponsiveGrid(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return const ResponsiveGrid(maxAxisCount: 4);
          } else if (constraints.maxWidth > 800) {
            return const ResponsiveGrid(maxAxisCount: 2);
          }
          return const ResponsiveGrid(maxAxisCount: 1);
        },
      ),
    );
  }

  showCartModal({required BuildContext context}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => const CartModal(),
    );
  }
}
