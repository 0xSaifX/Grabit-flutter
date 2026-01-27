import 'package:flutter/material.dart';

class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppHeader({super.key, required this.scaffoldKey});

  @override
  State<AppHeader> createState() => _AppHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _AppHeaderState extends State<AppHeader> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.white,
      child: SafeArea(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconButton(
                key: const ValueKey('header_menu_btn'),
                icon: const Icon(Icons.menu, color: Colors.green),
                onPressed: () => widget.scaffoldKey.currentState?.openDrawer(),
              ),
              const SizedBox(width: 8),
              const Text(
                'Grabit',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _searchController,
                    key: const ValueKey('header_search_field'),
                    decoration: const InputDecoration(
                      hintText: 'Search products...',
                      hintStyle: TextStyle(fontSize: 14),
                      prefixIcon: Icon(Icons.search, size: 20),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                key: const ValueKey('header_profile_btn'),
                icon: const Icon(Icons.person_outline),
                onPressed: () {},
              ),
              IconButton(
                key: const ValueKey('header_fav_btn'),
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              Stack(
                children: [
                  IconButton(
                    key: const ValueKey('header_cart_btn'),
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: const Text(
                        '0',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
