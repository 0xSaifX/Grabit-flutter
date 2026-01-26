import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryIcon extends StatelessWidget {
  final Category category;

  const CategoryIcon({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(category.icon, size: 40),
          Text(category.name),
          Text('${category.remaining} left'),
        ],
      ),
    );
  }
}
