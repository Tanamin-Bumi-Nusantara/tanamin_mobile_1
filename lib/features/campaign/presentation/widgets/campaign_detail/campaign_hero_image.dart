import 'package:flutter/material.dart';

class CampaignHeroImage extends StatelessWidget {
  final Size size;
  const CampaignHeroImage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.25,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://picsum.photos/800/400"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
        ),
      ],
    );
  }
}
