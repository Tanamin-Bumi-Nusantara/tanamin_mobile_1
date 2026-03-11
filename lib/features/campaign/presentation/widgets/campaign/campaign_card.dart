import 'package:flutter/material.dart';
import '../../../../../../core/presentation/widgets/custom_badge.dart'; // Sesuaikan path jika berbeda
import '../../../domain/entities/campaign.dart';

class CampaignCard extends StatelessWidget {
  final Campaign campaign;

  const CampaignCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    // Menghitung progress persentase
    final double progress = campaign.numberOfTrees / campaign.targetTrees;
    final String progressPercent = "${(progress * 100).toInt()}%";

    // Format harga sederhana
    final String formattedPrice =
        "Rp ${campaign.pricePerTree.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage("https://picsum.photos/400/600"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CustomBadge(
                        text: campaign.regency,
                        bgColor: Colors.white,
                        textColor: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 5),
                    CustomBadge(
                      text: campaign.status.toUpperCase(),
                      bgColor: Colors.green,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  campaign.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${campaign.numberOfTrees}/${campaign.targetTrees}",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    Text(
                      progressPercent,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white30,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.green,
                    ),
                    minHeight: 4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$formattedPrice/bibit",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
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
