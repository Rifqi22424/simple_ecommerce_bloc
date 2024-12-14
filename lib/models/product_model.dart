import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final double price;
  final Image image;
  final int quantity;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;

  Product copyWith({int? quantity}) {
    return Product(
        id: id,
        name: name,
        price: price,
        image: image,
        quantity: quantity ?? this.quantity);
  }

  @override
  List<Object?> get props => [id, name, price, image, quantity];

  static List<Product> products = [
    Product(
        id: 0,
        name: "Blue Shoes",
        price: 100.00,
        image: Image.asset('assets/images/blue_shoes.png')),
    Product(
        id: 1,
        name: "Purple Shoes",
        price: 100.00,
        image: Image.asset('assets/images/purple_shoes.png')),
    Product(
        id: 2,
        name: "Red Shoes",
        price: 150.00,
        image: Image.asset('assets/images/red_shoes.png')),
    Product(
        id: 3,
        name: "Red Shoes",
        price: 150.00,
        image: Image.asset('assets/images/all_red_shoes.png')),
    Product(
        id: 4,
        name: "Light Blue Shoes",
        price: 150.00,
        image: Image.asset('assets/images/all_blue_shoes.png')),
  ];
}
