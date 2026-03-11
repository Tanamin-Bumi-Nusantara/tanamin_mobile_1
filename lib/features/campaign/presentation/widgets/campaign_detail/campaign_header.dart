import 'package:flutter/material.dart';

class CampaignHeader extends StatelessWidget {
  const CampaignHeader({super.key});

  final Color _primaryGreen = const Color(0xFF0F5736);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        const SizedBox(width: 10),
        Icon(Icons.forest_outlined, color: _primaryGreen, size: 24),
        const SizedBox(width: 4),
        Text(
          "Tanamin",
          style: TextStyle(
            color: _primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
