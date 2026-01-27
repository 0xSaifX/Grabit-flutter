import 'package:flutter/material.dart';

class Category {
  final String name;
  final int remaining;
  final IconData? icon;
  final String? imageUrl;

  Category({
    required this.name, 
    required this.remaining, 
    this.icon,
    this.imageUrl,
  });
}
