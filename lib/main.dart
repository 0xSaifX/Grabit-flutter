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
