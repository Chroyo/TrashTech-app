import 'package:flutter/material.dart';

class GasLevelPage extends StatelessWidget {
  const GasLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gas Level')),
      body: const Center(
        child: Text(
          'Show gas emission data here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
