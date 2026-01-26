class Product {
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imageUrl;
  final bool isNew;
  final bool isSale;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.isNew = false,
    this.isSale = false,
  });
}
