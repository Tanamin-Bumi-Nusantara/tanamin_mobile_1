import 'package:flutter/material.dart';

class CampaignLocationCard extends StatelessWidget {
  const CampaignLocationCard({super.key});

  final Color _primaryGreen = const Color(0xFF0F5736);
  final Color _accentGreen = const Color(0xFF27AE60);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(
                  "https://miro.medium.com/v2/resize:fit:1200/1*y6C4nSvy2Woe0m7bWEn4BA.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Icon(Icons.location_on, color: Colors.red, size: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Aneka Tani Balikpapan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Lihat Peta",
                          style: TextStyle(
                            color: _primaryGreen,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 12,
                          color: _primaryGreen,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "Balikpapan, Kalimantan Timur",
                  style: TextStyle(color: _accentGreen, fontSize: 11),
                ),
                const Divider(height: 20),
                const Text(
                  "Deskripsi Lokasi",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  "Backwood Farm merupakan kawasan pertanian terpadu yang dikelilingi oleh bentang alam hijau dan lahan produktif. Lokasi ini dikenal sebagai area budidaya yang memanfaatkan kombinasi lahan terbuka...",
                  style: TextStyle(
                    color: _accentGreen,
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
