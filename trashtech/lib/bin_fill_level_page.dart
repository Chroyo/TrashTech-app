import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bin Fill Level',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const BinFillLevelPage(),
    );
  }
}

class BinFillLevelPage extends StatelessWidget {
  const BinFillLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bin Fill Level')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildBinCard('Bin #1', 53),
            _buildBinCard('Bin #2', 80),
            _buildBinCard('Bin #3', null),
            _buildBinCard('Bin #4', null),
          ],
        ),
      ),
    );
  }

  Widget _buildBinCard(String binName, int? fillPercentage) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Bin Name (Top)
          Text(
            binName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Bin Icon (Center)
          fillPercentage == null
              ? Icon(
                  Icons.delete,
                  size: 60,
                  color: Colors.grey.shade600,
                )
              : _buildPartiallyFilledBinIcon(fillPercentage),
          const SizedBox(height: 10),
          // Fill Level (Bottom)
          Text(
            fillPercentage != null ? '$fillPercentage%' : '-',
            style: TextStyle(
              fontSize: 16,
              color: fillPercentage != null ? Colors.teal.shade800 : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a bin icon that is partially red from the bottom,
  /// based on the [fillPercentage].
  Widget _buildPartiallyFilledBinIcon(int fillPercentage) {
    // Ensure fillPercentage is between 0 and 100
    fillPercentage = math.max(0, math.min(fillPercentage, 100));

    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Red bin icon behind
          Icon(
            Icons.delete,
            size: 60,
            color: Colors.red,
          ),
          // Black bin icon on top, clipped so the bottom portion is cut out
          ClipRect(
            clipper: FillClipper(fillPercentage),
            child: Icon(
              Icons.delete,
              size: 60,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class FillClipper extends CustomClipper<Rect> {
  final int fillPercentage;

  FillClipper(this.fillPercentage);

  @override
  Rect getClip(Size size) {
    // The height that remains black is the top portion,
    // so we calculate how much to keep: (100 - fill)%
    final clipHeight = (100 - fillPercentage) / 100 * size.height;
    // This rectangle defines the visible region of the black icon.
    // We keep from the top (0) down to [clipHeight], and clip out the bottom.
    return Rect.fromLTWH(0, 0, size.width, clipHeight);
  }

  @override
  bool shouldReclip(covariant FillClipper oldClipper) {
    return oldClipper.fillPercentage != fillPercentage;
  }
}
