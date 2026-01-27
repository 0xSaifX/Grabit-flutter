import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product? product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (product == null) return const SizedBox.shrink();

    return Card(
      key: ValueKey('product_card_${product!.name}_${product!.price}'),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                _buildImage(),
                _buildBadge(),
              ],
            ),
            _buildInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge() {
    if (product!.isNew) {
      return _PositionedBadge(label: 'New', color: Colors.green);
    }
    if (product!.isSale) {
      return _PositionedBadge(label: 'Sale', color: Colors.red);
    }
    return const SizedBox.shrink();
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product!.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            product!.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 14),
              const SizedBox(width: 4),
              Text('${product!.rating}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '\$${product!.price.toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    final String url = product?.imageUrl ?? '';
    
    return AspectRatio(
      aspectRatio: 1.5,
      child: url.isEmpty 
          ? _buildImagePlaceholder()
          : (url.startsWith('http')
              ? Image.network(
                  url,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(),
                )
              : Image.asset(
                  url,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(),
                )),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
    );
  }
}

class _PositionedBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _PositionedBadge({required this.label, required this.color});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
