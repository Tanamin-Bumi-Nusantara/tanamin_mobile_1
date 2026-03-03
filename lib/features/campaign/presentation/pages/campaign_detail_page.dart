import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampaignDetailPage extends StatefulWidget {
  const CampaignDetailPage({super.key});

  @override
  State<CampaignDetailPage> createState() => _CampaignDetailPageState();
}

class _CampaignDetailPageState extends State<CampaignDetailPage> {
  // Warna Utama
  final Color _primaryGreen = const Color(0xFF0F5736);
  final Color _accentGreen = const Color(0xFF27AE60);
  final Color _lightBlueBg = const Color(0xFFE5F6F6);

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
    // Media Query
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.05; // 5%

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
                child: _buildHeader(context),
              ),

              // 2. Hero Image / Video Section
              _buildHeroImage(size),

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
                    Text(
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
                    _buildProgressCard(),
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
                            child: Icon(
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
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            Icons.sell,
                            "Rp 25.000",
                            "Per Pohon",
                            Colors.teal,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildInfoCard(
                            Icons.calendar_today,
                            "23 Feb 2025",
                            "Waktu Pelaksanaan",
                            Colors.teal,
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
                      children: [
                        _buildSdgIcon(Colors.redAccent, "8"),
                        const SizedBox(width: 8),
                        _buildSdgIcon(Colors.orangeAccent, "11"),
                        const SizedBox(width: 8),
                        _buildSdgIcon(Colors.amber, "12"),
                        const SizedBox(width: 8),
                        _buildSdgIcon(Colors.green, "13"),
                        const SizedBox(width: 8),
                        _buildSdgIcon(Colors.lightGreen, "15"),
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
                    _buildLocationCard(size),
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
                              // Placeholder logo pertamina
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
                    // Extra space bottom
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

  // --- COMPONENTS ---

  Widget _buildHeader(BuildContext context) {
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

  Widget _buildHeroImage(Size size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.25,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://picsum.photos/800/400",
              ), // Placeholder
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Overlay Play Button
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

  Widget _buildProgressCard() {
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

  Widget _buildInfoCard(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(label, style: TextStyle(color: color, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildSdgIcon(Color color, String number) {
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
          // Placeholder layout for SDG icon
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

  Widget _buildLocationCard(Size size) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Map Image Placeholder
          Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(
                  "https://miro.medium.com/v2/resize:fit:1200/1*y6C4nSvy2Woe0m7bWEn4BA.png",
                ), // Dummy Maps
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
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
