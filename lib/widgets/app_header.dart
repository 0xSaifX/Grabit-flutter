import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/cart_page.dart';
import '../pages/order_page.dart';

class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AppHeader({super.key, required this.scaffoldKey});

  @override
  State<AppHeader> createState() => _AppHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _AppHeaderState extends State<AppHeader> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateTo(Widget page) {
     Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              IconButton(
                key: const ValueKey('header_menu'),
                onPressed: () => widget.scaffoldKey.currentState?.openDrawer(),
                icon: const Icon(Icons.menu_rounded, color: Colors.green, size: 28),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
                child: const Text(
                  'Grabit',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Colors.green,
                    letterSpacing: -1,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: _searchController,
                    key: const ValueKey('header_search'),
                    decoration: const InputDecoration(
                      hintText: 'Search for groceries...',
                      icon: Icon(Icons.search_rounded, size: 20, color: Colors.grey),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _HeaderActionBtn(icon: Icons.person_outline_rounded, keyStr: 'profile', onTap: () => _navigateTo(const LoginPage())),
              _HeaderActionBtn(icon: Icons.history_rounded, keyStr: 'orders', onTap: () => _navigateTo(const OrderPage())),
              _HeaderActionBtn(
                icon: Icons.shopping_basket_outlined, 
                keyStr: 'cart', 
                badge: '3',
                onTap: () => _navigateTo(const CartPage()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderActionBtn extends StatelessWidget {
  final IconData icon;
  final String keyStr;
  final String? badge;
  final VoidCallback onTap;

  const _HeaderActionBtn({required this.icon, required this.keyStr, this.badge, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          key: ValueKey('header_btn_$keyStr'),
          onPressed: onTap,
          icon: Icon(icon, color: Colors.black87),
        ),
        if (badge != null)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
              child: Text(
                badge!,
                style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
