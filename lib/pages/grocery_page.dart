import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_drawer.dart';

class GroceryPage extends StatefulWidget {
  const GroceryPage({super.key});

  @override
  State<GroceryPage> createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppHeader(scaffoldKey: _scaffoldKey),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text(
          'Grocery Page Coming Soon',
          key: ValueKey('grocery_page_text'),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
