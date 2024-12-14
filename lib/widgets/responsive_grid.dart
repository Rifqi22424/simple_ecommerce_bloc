import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'product_card.dart';

class ResponsiveGrid extends StatelessWidget {
  final int maxAxisCount;
  const ResponsiveGrid({
    super.key,
    required this.maxAxisCount
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: maxAxisCount,
          mainAxisExtent: MediaQuery.of(context).size.height / 4 + 90),
      itemCount: Product.products.length,
      itemBuilder: (context, index) {
        final product = Product.products[index];
        return ProductCard(product: product);
      },
    );
  }
}
