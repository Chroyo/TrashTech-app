import 'package:flutter/material.dart';

class ClosestBinsPage extends StatelessWidget {
  const ClosestBinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Closest Bins')),
      body: const Center(
        child: Text(
          'Display the nearest bins here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
