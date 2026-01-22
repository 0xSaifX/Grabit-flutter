import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

const showDebugBanner = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grabit App',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: showDebugBanner,
      routes: {
        '/': (context) => const HomePage(),
        '/grocery': (context) => const GroceryPage(),
        '/fashion': (context) => const FashionPage(),
        '/jewelleries': (context) => const JewelleriesPage(),
        '/vegetables': (context) => const VegetablesPage(),
        '/order': (context) => const OrderPage(),
        '/cart': (context) => const CartPage(),
        '/account': (context) => const AccountPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grabit'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.account_circle), onPressed: () {}),
          IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Grabit Menu')),
            ListTile(
              title: const Text('Grocery'),
              onTap: () => Navigator.pushNamed(context, '/grocery'),
            ),
            ListTile(
              title: const Text('Fashion'),
              onTap: () => Navigator.pushNamed(context, '/fashion'),
            ),
            ListTile(
              title: const Text('Jewelleries'),
              onTap: () => Navigator.pushNamed(context, '/jewelleries'),
            ),
            ListTile(
              title: const Text('Vegetables'),
              onTap: () => Navigator.pushNamed(context, '/vegetables'),
            ),
            ListTile(
              title: const Text('Order'),
              onTap: () => Navigator.pushNamed(context, '/order'),
            ),
            ListTile(
              title: const Text('Cart'),
              onTap: () => Navigator.pushNamed(context, '/cart'),
            ),
            ListTile(
              title: const Text('Account'),
              onTap: () => Navigator.pushNamed(context, '/account'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://via.placeholder.com/800x300?text=Hero+Image',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Text(
                      'Fresh Groceries\nDelivered Fast',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 20,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text('Shop Now'),
                    ),
                  ),
                ],
              ),
            ),
            // Category Icons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryIcon(Icons.restaurant, 'Fruits', '50 left'),
                  _buildCategoryIcon(
                    Icons.local_florist,
                    'Vegetables',
                    '30 left',
                  ),
                  _buildCategoryIcon(Icons.cake, 'Bakery', '20 left'),
                  _buildCategoryIcon(Icons.fastfood, 'Snacks', '40 left'),
                  _buildCategoryIcon(Icons.local_drink, 'Drinks', '60 left'),
                  _buildCategoryIcon(
                    Icons.local_grocery_store,
                    'Milk',
                    '25 left',
                  ),
                ],
              ),
            ),
            // Product Cards
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  _buildProductCard('New'),
                  _buildProductCard('Sale'),
                  _buildProductCard(''),
                ],
              ),
            ),
            // Another Image Section
            Container(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: Image.network(
                      'https://via.placeholder.com/400x200?text=Vegetables',
                    ),
                  ),
                  Expanded(
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Fresh Vegetables',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Get the best quality vegetables delivered to your door.',
                          ),
                          ElevatedButton(
                            onPressed: null,
                            child: Text('Order Now'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // New Arrivals
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: null, child: Text('Stock 1')),
                      ElevatedButton(onPressed: null, child: Text('Stock 2')),
                      ElevatedButton(onPressed: null, child: Text('Stock 3')),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => _buildProductCard(''),
                    ),
                  ),
                ],
              ),
            ),
            // Two Images
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://via.placeholder.com/400x200?text=Image1',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          right: 20,
                          top: 50,
                          child: Column(
                            children: [
                              Text(
                                'Text 1',
                                style: TextStyle(color: Colors.white),
                              ),
                              ElevatedButton(
                                onPressed: null,
                                child: Text('Button 1'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://via.placeholder.com/400x200?text=Image2',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          right: 20,
                          top: 50,
                          child: Column(
                            children: [
                              Text(
                                'Text 2',
                                style: TextStyle(color: Colors.white),
                              ),
                              ElevatedButton(
                                onPressed: null,
                                child: Text('Button 2'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Customer Support
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSupportIcon(Icons.verified, 'Guarantee'),
                  _buildSupportIcon(Icons.payment, 'Secure Payment'),
                  _buildSupportIcon(Icons.refresh, 'Return Policy'),
                ],
              ),
            ),
            // Top Selling, etc.
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Top Selling',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildProductCard(''),
                      _buildProductCard(''),
                      _buildProductCard(''),
                    ],
                  ),
                  const Text(
                    'Top Rated',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildProductCard(''),
                      _buildProductCard(''),
                      _buildProductCard(''),
                    ],
                  ),
                  const Text(
                    'Trending',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildProductCard(''),
                      _buildProductCard(''),
                      _buildProductCard(''),
                    ],
                  ),
                ],
              ),
            ),
            // Footer
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text(
                        'Categories',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Fruits', style: TextStyle(color: Colors.white)),
                      Text('Vegetables', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Company',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('About', style: TextStyle(color: Colors.white)),
                      Text('Contact', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Contact',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Email', style: TextStyle(color: Colors.white)),
                      Text('Phone', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String name, String amount) {
    return Column(
      children: [
        Icon(icon, size: 40),
        Text(name),
        Text(amount, style: const TextStyle(color: Colors.red)),
      ],
    );
  }

  Widget _buildProductCard(String banner) {
    return Card(
      child: SizedBox(
        width: 150,
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(
                  'https://via.placeholder.com/150x100?text=Product',
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Description'),
                      Text(
                        'Product Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(children: [Icon(Icons.star, size: 16), Text('4.5')]),
                      Text('\$10.00'),
                    ],
                  ),
                ),
              ],
            ),
            if (banner.isNotEmpty)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    banner,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportIcon(IconData icon, String text) {
    return Column(children: [Icon(icon, size: 40), Text(text)]);
  }
}

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

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: const Center(child: Text('Account Page')),
    );
  }
}
