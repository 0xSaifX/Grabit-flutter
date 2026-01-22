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
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Grabit App')),
        body: const Center(
          child: Text(
            'Welcome to Grabit App',
            style: TextStyle(fontSize: 24, color: Colors.yellow),
          ),
        ),
      ),
    );
  }
}

class GrabitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grabit',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grabit'),
        actions: [
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [HeroSection(), CategoryRow(), ProductGrid(), Footer()],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/hero_image.jpg', fit: BoxFit.cover),
        Positioned(
          left: 20,
          top: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Grab it now!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Shop Now')),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategoryIcon(icon: Icons.apple, label: 'Fruits', amount: '10'),
        CategoryIcon(icon: Icons.carrot, label: 'Vegetables', amount: '5'),
        CategoryIcon(icon: Icons.bakery_dining, label: 'Bakery', amount: '8'),
        CategoryIcon(icon: Icons.fastfood, label: 'Snacks', amount: '12'),
        CategoryIcon(icon: Icons.local_drink, label: 'Drinks', amount: '15'),
        CategoryIcon(icon: Icons.milk, label: 'Milk', amount: '20'),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String amount;

  CategoryIcon({required this.icon, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(icon, size: 40), Text(label), Text(amount)]);
  }
}

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ProductCard();
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset('assets/product_image.jpg'),
          Text('Product Name'),
          Text('Description'),
          Text('Rating: 4.5'),
          Text('10.00'),
          Positioned(
            right: 0,
            child: Container(color: Colors.red, child: Text('New')),
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [Text('Categories'), Text('Company'), Text('Contact')],
      ),
    );
  }
}
