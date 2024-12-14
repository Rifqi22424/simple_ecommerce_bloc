import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../consts/app_styles.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: product.image,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(product.name, style: AppStyles.h4),
                    Text('\$${product.price}', style: AppStyles.paragraph),
                  ],
                ),
                IconButton(
                    onPressed: () => context
                        .read<CartBloc>()
                        .add(AddToCart(product: product)),
                    icon: const Icon(Icons.add_shopping_cart_outlined))
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
