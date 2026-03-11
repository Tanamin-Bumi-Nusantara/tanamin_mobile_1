import 'package:flutter/material.dart';

class CampaignSdgIcon extends StatelessWidget {
  final Color color;
  final String number;

  const CampaignSdgIcon({super.key, required this.color, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          const Icon(Icons.public, color: Colors.white, size: 12),
        ],
      ),
    );
  }
}
