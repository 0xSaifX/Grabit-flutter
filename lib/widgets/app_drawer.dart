import 'package:flutter/material.dart';
import '../pages/grocery_page.dart';
import '../pages/fashion_page.dart';
import '../pages/jewelleries_page.dart';
import '../pages/vegetables_page.dart';
import '../pages/order_page.dart';
import '../pages/cart_page.dart';
import '../pages/login_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Grabit Menu')),
          ListTile(
            title: const Text('Grocery'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GroceryPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Fashion'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FashionPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Jewelleries'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const JewelleriesPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Vegetables'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const VegetablesPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Order'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrderPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Cart'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
