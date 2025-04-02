import 'package:flutter/material.dart';
import 'closest_bins_page.dart';
import 'bin_fill_level_page.dart';
import 'waste_classification_page.dart';
import 'gas_level_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrashTech'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // 1) Closest Bins
          _buildModuleCard(
            context,
            title: 'Closest Bins',
            subtitle: 'View details',
            color: Colors.blue,
            icon: Icons.location_on,
            page: const ClosestBinsPage(),
          ),
          // 2) Bin Fill Level
          _buildModuleCard(
            context,
            title: 'Bin Fill Level',
            subtitle: 'View details',
            color: Colors.green,
            icon: Icons.delete_outline,
            page: const BinFillLevelPage(),
          ),
          // 3) Waste Classification
          _buildModuleCard(
            context,
            title: 'Waste Classification',
            subtitle: 'View details',
            color: Colors.orange,
            icon: Icons.category,
            page: const WasteClassificationPage(),
          ),
          // 4) Gas Level
          _buildModuleCard(
            context,
            title: 'Gas Level',
            subtitle: 'View details',
            color: Colors.redAccent,
            icon: Icons.air,
            page: const GasLevelPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Color color,
    required IconData icon,
    required Widget page,
  }) {
    return InkWell(
      onTap: () {
        // Navigate to the corresponding page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
