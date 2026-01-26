import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/category.dart';
import '../widgets/category_icon.dart';
import '../widgets/product_card.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';
import '../constants/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppHeader(scaffoldKey: _scaffoldKey),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                // Hero Section
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image.asset(
                        'assets/images/fashion1.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey,
                          child: const Center(child: Text('Hero Image')),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Fresh Groceries',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Delivered to your door',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Shop Now'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Categories Row
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryIcon(
                        category: Category(
                          name: 'Fruits',
                          remaining: 50,
                          icon: Icons.apple,
                        ),
                      ),
                      CategoryIcon(
                        category: Category(
                          name: 'Vegetables',
                          remaining: 30,
                          icon: Icons.grass,
                        ),
                      ),
                      CategoryIcon(
                        category: Category(
                          name: 'Bakery',
                          remaining: 20,
                          icon: Icons.cake,
                        ),
                      ),
                      CategoryIcon(
                        category: Category(
                          name: 'Snacks',
                          remaining: 40,
                          icon: Icons.fastfood,
                        ),
                      ),
                      CategoryIcon(
                        category: Category(
                          name: 'Drinks',
                          remaining: 60,
                          icon: Icons.local_drink,
                        ),
                      ),
                      CategoryIcon(
                        category: Category(
                          name: 'Milk',
                          remaining: 25,
                          icon: Icons.local_cafe,
                        ),
                      ),
                    ],
                  ),
                ),
                // Product Cards Section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Featured Products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: Product(
                        name: 'Product ${index + 1}',
                        description: 'Description ${index + 1}',
                        price: 10.0 + index,
                        rating: 4.5,
                        imageUrl:
                            'https://via.placeholder.com/200?text=Product+${index + 1}',
                        isNew: index % 2 == 0,
                        isSale: index % 3 == 0,
                      ),
                    );
                  },
                ),
                // Vegetables Image Section
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image.asset(
                        'assets/images/background2.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey,
                          child: const Center(child: Text('Vegetables Image')),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Fresh Vegetables',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Healthy and Organic',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Shop Now'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // New Arrivals
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'New Arrivals',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Stock 1'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Stock 2'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: Product(
                          name: 'New Product ${index + 1}',
                          description: 'New Description ${index + 1}',
                          price: 15.0 + index,
                          rating: 4.0,
                          imageUrl:
                              'https://via.placeholder.com/150?text=New+${index + 1}',
                          isNew: true,
                        ),
                      );
                    },
                  ),
                ),
                // Two Images Section
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Image.network(
                            'https://via.placeholder.com/400x300?text=Image1',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 20,
                            top: 50,
                            child: Column(
                              children: [
                                const Text(
                                  'Text 1',
                                  style: TextStyle(color: Colors.white),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Button 1'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Image.network(
                            'https://via.placeholder.com/400x300?text=Image2',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 20,
                            top: 50,
                            child: Column(
                              children: [
                                const Text(
                                  'Text 2',
                                  style: TextStyle(color: Colors.white),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Button 2'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Customer Support
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Column(
                        children: [
                          Icon(Icons.security, size: 50),
                          Text('Guarantee'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.payment, size: 50),
                          Text('Secure Payment'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.refresh, size: 50),
                          Text('Return Policy'),
                        ],
                      ),
                    ],
                  ),
                ),
                // Top Selling, Top Rated, Trending
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Top Selling',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: Product(
                        name: 'Top Selling ${index + 1}',
                        description: 'Desc',
                        price: 20.0,
                        rating: 5.0,
                        imageUrl: AppConstants.imagePath[index],
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Top Rated',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: Product(
                        name: 'Top Rated ${index + 1}',
                        description: 'Desc',
                        price: 25.0,
                        rating: 4.8,
                        imageUrl: AppConstants.imagePath2[index],
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Trending',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: Product(
                        name: 'Trending ${index + 1}',
                        description: 'Desc',
                        price: 30.0,
                        rating: 4.7,
                        imageUrl: AppConstants.imagePath3[index],
                      ),
                    );
                  },
                ),
                // Footer
                const AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
