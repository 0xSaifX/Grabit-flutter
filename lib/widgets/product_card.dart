import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Column(
            children: [
              Image.network(
                product.imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(product.description),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        Text('${product.rating}'),
                      ],
                    ),
                    Text('\$${product.price}'),
                  ],
                ),
              ),
            ],
          ),
          if (product.isNew)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(4),
                child: const Text('New', style: TextStyle(color: Colors.white)),
              ),
            ),
          if (product.isSale)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(4),
                child: const Text(
                  'Sale',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
