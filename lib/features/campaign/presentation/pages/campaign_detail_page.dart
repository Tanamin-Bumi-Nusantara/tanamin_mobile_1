import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import widget yang sudah dipisahkan
import '../widgets/campaign_detail/campaign_header.dart';
import '../widgets/campaign_detail/campaign_hero_image.dart';
import '../widgets/campaign_detail/campaign_progress_card.dart';
import '../widgets/campaign_detail/campaign_info_card.dart';
import '../widgets/campaign_detail/campaign_sdg_icon.dart';
import '../widgets/campaign_detail/campaign_location_card.dart';

class CampaignDetailPage extends StatefulWidget {
  const CampaignDetailPage({super.key});

  @override
  State<CampaignDetailPage> createState() => _CampaignDetailPageState();
}

class _CampaignDetailPageState extends State<CampaignDetailPage> {
  // Warna Utama
  final Color _primaryGreen = const Color(0xFF0F5736);
  final Color _accentGreen = const Color(0xFF27AE60);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header (Back Button & Logo)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingHorizontal,
                  vertical: 10,
                ),
                child: const CampaignHeader(),
              ),

              // 2. Hero Image / Video Section
              CampaignHeroImage(size: size),

              // 3. Content Body
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingHorizontal,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title & Price
                    const Text(
                      "Gerakan 1000 Pohon Mangrove Kariangau",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Rp 10.000/bibit",
                      style: TextStyle(
                        color: _accentGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Social Stats & Badge
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "2.3k",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Icon(
                          Icons.share_outlined,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "bagikan",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _accentGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Open",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Progress Card
                    const CampaignProgressCard(),
                    const SizedBox(height: 20),

                    // Deskripsi (Tentang Kampanye)
                    const Text(
                      "Tentang Kampanye",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12,
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(
                            text:
                                "Pantai Indah Kapuk (PIK) yang terletak di Kota Jakarta Utara, DKI Jakarta telah menjadi pusat ekowisata dan konservasi mangrove. Kegiatan konservasi dilakukan karena PIK merupakan wilayah benteng abrasi bagi pantai Jakarta. Dengan adanya pusat konservasi ini diharapkan banjir rob di pesisir Jakarta dapat ditekan. Melalui kampanye alam, ",
                          ),
                          TextSpan(
                            text: "Baca Selengkapnya..",
                            style: TextStyle(
                              color: _accentGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Tabs (Icons)
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: _primaryGreen,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Icon(Icons.people, color: _primaryGreen),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: const Icon(
                              Icons.volunteer_activism,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Tombol Donasi (Floating style in content)
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: const Text(
                          "Donasi Sekarang",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Info Cards (Price & Date)
                    Row(
                      children: const [
                        Expanded(
                          child: CampaignInfoCard(
                            icon: Icons.sell,
                            value: "Rp 25.000",
                            label: "Per Pohon",
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CampaignInfoCard(
                            icon: Icons.calendar_today,
                            value: "23 Feb 2025",
                            label: "Waktu Pelaksanaan",
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // SDGs
                    const Text(
                      "Sustainable Development Goals",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        CampaignSdgIcon(color: Colors.redAccent, number: "8"),
                        SizedBox(width: 8),
                        CampaignSdgIcon(
                          color: Colors.orangeAccent,
                          number: "11",
                        ),
                        SizedBox(width: 8),
                        CampaignSdgIcon(color: Colors.amber, number: "12"),
                        SizedBox(width: 8),
                        CampaignSdgIcon(color: Colors.green, number: "13"),
                        SizedBox(width: 8),
                        CampaignSdgIcon(color: Colors.lightGreen, number: "15"),
                      ],
                    ),
                    const SizedBox(height: 25),

                    // Lokasi Penanaman
                    const Text(
                      "Lokasi Penanaman",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const CampaignLocationCard(),
                    const SizedBox(height: 25),

                    // Mitra Pelaksana
                    const Text(
                      "Mitra Pelaksana",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Pertamina_Logo.svg/1200px-Pertamina_Logo.svg.png",
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "PT. Pertamina Patra Niaga",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Donatur Utama",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
