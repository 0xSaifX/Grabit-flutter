import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

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

class Category {
  final String name;
  final int remaining;
  final IconData icon;

  Category({required this.name, required this.remaining, required this.icon});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grabit',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
              const SizedBox(width: 10),
              const Text(
                'Grabit',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(icon: const Icon(Icons.person_add), onPressed: () {}),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Grabit Menu')),
            ListTile(
              title: const Text('Grocery'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GroceryPage()),
              ),
            ),
            ListTile(
              title: const Text('Fashion'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FashionPage()),
              ),
            ),
            ListTile(
              title: const Text('Jewelleries'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const JewelleriesPage()),
              ),
            ),
            ListTile(
              title: const Text('Vegetables'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const VegetablesPage()),
              ),
            ),
            ListTile(
              title: const Text('Order'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrderPage()),
              ),
            ),
            ListTile(
              title: const Text('Cart'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              ),
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              ),
            ),
          ],
        ),
      ),
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
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
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
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
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
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.security, size: 50),
                          const Text('Guarantee'),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.payment, size: 50),
                          const Text('Secure Payment'),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.refresh, size: 50),
                          const Text('Return Policy'),
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
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: Product(
                        name: 'Top Selling ${index + 1}',
                        description: 'Desc',
                        price: 20.0,
                        rating: 5.0,
                        imageUrl:
                            'https://via.placeholder.com/200?text=Top+${index + 1}',
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
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: Product(
                        name: 'Top Rated ${index + 1}',
                        description: 'Desc',
                        price: 25.0,
                        rating: 4.8,
                        imageUrl:
                            'https://via.placeholder.com/200?text=Rated+${index + 1}',
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
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: Product(
                        name: 'Trending ${index + 1}',
                        description: 'Desc',
                        price: 30.0,
                        rating: 4.7,
                        imageUrl:
                            'https://via.placeholder.com/200?text=Trend+${index + 1}',
                      ),
                    );
                  },
                ),
                // Footer
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Categories',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Fruits', style: TextStyle(color: Colors.white)),
                          Text(
                            'Vegetables',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('Bakery', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Company',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'About Us',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Contact',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Careers',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Contact',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Email: info@grabit.com',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Phone: 123-456-7890',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Address: 123 Main St',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

// Placeholder pages
class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grocery')),
      body: const Center(child: Text('Grocery Page')),
    );
  }
}

class FashionPage extends StatelessWidget {
  const FashionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fashion')),
      body: const Center(child: Text('Fashion Page')),
    );
  }
}

class JewelleriesPage extends StatelessWidget {
  const JewelleriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jewelleries')),
      body: const Center(child: Text('Jewelleries Page')),
    );
  }
}

class VegetablesPage extends StatelessWidget {
  const VegetablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vegetables')),
      body: const Center(child: Text('Vegetables Page')),
    );
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order')),
      body: const Center(child: Text('Order Page')),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: const Center(child: Text('Cart Page')),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Center(child: Text('Login Page')),
    );
  }
}
