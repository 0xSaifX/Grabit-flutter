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
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.shopping_basket_rounded, color: Colors.green, size: 40),
                  ),
                  const SizedBox(height: 12),
                  const Text('Grabit Menu', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _DrawerItem(icon: Icons.storefront_rounded, label: 'Grocery', page: const GroceryPage()),
                _DrawerItem(icon: Icons.checkroom_rounded, label: 'Fashion', page: const FashionPage()),
                _DrawerItem(icon: Icons.watch_outlined, label: 'Jewelleries', page: const JewelleriesPage()),
                _DrawerItem(icon: Icons.eco_rounded, label: 'Vegetables', page: const VegetablesPage()),
                const Divider(indent: 20, endIndent: 20),
                _DrawerItem(icon: Icons.receipt_long_rounded, label: 'My Orders', page: const OrderPage()),
                _DrawerItem(icon: Icons.shopping_cart_outlined, label: 'Cart', page: const CartPage()),
                const Divider(indent: 20, endIndent: 20),
                _DrawerItem(icon: Icons.login_rounded, label: 'Login / Register', page: const LoginPage()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget page;
  const _DrawerItem({required this.icon, required this.label, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.green[700]),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      visualDensity: VisualDensity.compact,
    );
  }
}
