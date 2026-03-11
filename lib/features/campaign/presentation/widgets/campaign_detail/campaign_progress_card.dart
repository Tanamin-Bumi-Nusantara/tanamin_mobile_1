import 'package:flutter/material.dart';

class CampaignProgressCard extends StatelessWidget {
  const CampaignProgressCard({super.key});

  final Color _primaryGreen = const Color(0xFF0F5736);
  final Color _accentGreen = const Color(0xFF27AE60);
  final Color _lightBlueBg = const Color(0xFFE5F6F6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _lightBlueBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Donasi Terkumpul",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              Text(
                "Close Date: 20 Feb 2026",
                style: TextStyle(color: Colors.red, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "150/300 Bibit",
                style: TextStyle(
                  color: _primaryGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Text(
                "50 %",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(_accentGreen),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
