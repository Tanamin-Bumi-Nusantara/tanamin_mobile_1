import 'package:flutter/material.dart';

class CampaignSearchBar extends StatelessWidget {
  const CampaignSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Cari Kampanye",
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Colors.green[700]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Icon(Icons.filter_list_alt, color: Colors.green[700], size: 28),
      ],
    );
  }
}
