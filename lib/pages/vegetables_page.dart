import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_drawer.dart';

class VegetablesPage extends StatefulWidget {
  const VegetablesPage({super.key});

  @override
  State<VegetablesPage> createState() => _VegetablesPageState();
}

class _VegetablesPageState extends State<VegetablesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppHeader(scaffoldKey: _scaffoldKey),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text(
          'Vegetables Page Coming Soon',
          key: ValueKey('vegetables_page_text'),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
