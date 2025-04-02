import 'package:flutter/material.dart';

class WasteClassificationPage extends StatelessWidget {
  const WasteClassificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Waste Classification')),
      body: const Center(
        child: Text(
          'Classify waste here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
