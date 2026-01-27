import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_drawer.dart';

class JewelleriesPage extends StatefulWidget {
  const JewelleriesPage({super.key});

  @override
  State<JewelleriesPage> createState() => _JewelleriesPageState();
}

class _JewelleriesPageState extends State<JewelleriesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppHeader(scaffoldKey: _scaffoldKey),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text(
          'Jewelleries Page Coming Soon',
          key: ValueKey('jewelleries_page_text'),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
