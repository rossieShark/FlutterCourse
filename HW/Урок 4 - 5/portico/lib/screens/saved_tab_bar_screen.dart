import 'package:flutter/material.dart';

class SavedTabBarScreen extends StatelessWidget {
  const SavedTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forth Tab'),
      ),
      body: const Center(
        child: Text(
          'In process...',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
