import 'package:flutter/material.dart';
import 'my_catalog.dart';
import 'my_cart.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Cart',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyCatalog(),
    );
  }
}
