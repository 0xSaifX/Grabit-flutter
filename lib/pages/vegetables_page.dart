import 'package:flutter/material.dart';

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
