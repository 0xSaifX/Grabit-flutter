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
            key: const ValueKey('nav_grocery'),
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Grocery'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const GroceryPage()));
            },
          ),
          ListTile(
            key: const ValueKey('nav_fashion'),
            leading: const Icon(Icons.checkroom),
            title: const Text('Fashion'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const FashionPage()));
            },
          ),
          ListTile(
            key: const ValueKey('nav_jewel'),
            leading: const Icon(Icons.watch),
            title: const Text('Jewelleries'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const JewelleriesPage()));
            },
          ),
          ListTile(
            key: const ValueKey('nav_veg'),
            leading: const Icon(Icons.eco),
            title: const Text('Vegetables'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const VegetablesPage()));
            },
          ),
          ListTile(
            key: const ValueKey('nav_order'),
            leading: const Icon(Icons.receipt_long),
            title: const Text('Order'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderPage()));
            },
          ),
          ListTile(
            key: const ValueKey('nav_cart'),
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage()));
            },
          ),
          ListTile(
            key: const ValueKey('nav_login'),
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
