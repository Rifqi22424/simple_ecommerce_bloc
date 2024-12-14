import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
      colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white, // Warna utama
    onPrimary: Colors.white, // Warna teks di atas warna utama
    secondary: Colors.white, // Warna aksen
    onSecondary: Colors.white, // Warna teks di atas warna aksen
    error: Colors.red, // Warna untuk error
    onError: Colors.white, // Warna teks di atas warna error
    surface: Colors.white, // Warna untuk elemen permukaan (misalnya card)
    onSurface: Colors.black, // Warna teks di atas elemen permukaan
  ));
}
