import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Memaksa orientasi Portrait sesuai request
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // Media Query untuk Responsiveness
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double paddingHorizontal = screenWidth * 0.05; // 5% dari lebar layar

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8), // Background abu-abu muda
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Header (Logo & Profile)
                _buildHeader(),
                const SizedBox(height: 20),

                // 2. Statistik Donasi Card
                _buildDonationStatsCard(screenWidth),
                const SizedBox(height: 25),

                // 3. Dampak Kontribusi (Grid)
                Text(
                  "Dampak Kontribusi Anda",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 15),
                _buildImpactGrid(screenWidth),
                const SizedBox(height: 25),

                // 4. Proyek CSR (List)
                _buildSectionHeader("Proyek CSR anda", () {}),
                const SizedBox(height: 15),
                _buildProjectList(screenWidth),

                // Extra space di bawah agar tidak mentok
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildHeader() {
    return Row(
      children: [
        // Logo Placeholder
        Icon(Icons.forest, color: Colors.green, size: 30),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tanamin",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green[800],
              ),
            ),
            Text("v.0.0.1", style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        const Spacer(),
        Icon(Icons.notifications_outlined, color: Colors.green[700]),
        const SizedBox(width: 15),
        const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.green,
          child: Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildDonationStatsCard(double screenWidth) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "Hi, Faiq",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5),
              Text("👋", style: TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Statistik Donasi Anda :",
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: _buildStatBox("Rp 2,485,000", "Total Donasi")),
              const SizedBox(width: 15),
              Expanded(child: _buildStatBox("156", "Total Kampanye")),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Selengkapnya >",
                style: TextStyle(color: Colors.green[700], fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildImpactGrid(double screenWidth) {
    // Grid 2x2 Manual menggunakan Column & Row agar safe di dalam SingleChildScrollView
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildImpactItem(
                "CO2",
                "6 Ton",
                "Emisi Karbon Terserap per Tahun",
                "assets/images/forest1.jpg",
              ),
            ), // Ganti asset
            const SizedBox(width: 15),
            Expanded(
              child: _buildImpactItem(
                "O2",
                "3 Ton",
                "Oksigen yang Dihasilkan per Tahun",
                "assets/images/forest2.jpg",
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: _buildImpactItem(
                "Tree",
                "300",
                "Pohon yang ditanam",
                "assets/images/forest3.jpg",
                icon: Icons.forest,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildImpactItem(
                "Earth",
                "0,54 ha",
                "Lahan Dihijaukan",
                "assets/images/forest4.jpg",
                icon: Icons.public,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImpactItem(
    String title,
    String value,
    String desc,
    String imagePath, {
    IconData? icon,
  }) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          // GANTI NetworkImage dengan AssetImage jika sudah ada file
          // image: AssetImage(imagePath),
          image: NetworkImage("https://picsum.photos/200/300"), // Placeholder
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Overlay Gelap agar tulisan terbaca
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.green.withOpacity(0.6),
                ],
              ),
            ),
          ),
          // Konten Text
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(icon, color: Colors.white, size: 30)
                else
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "Lihat Semua >",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectList(double screenWidth) {
    return Column(
      children: [
        _buildProjectCard(
          "Open",
          "Gerakan 1000 Pohon Mangrove Kariangau",
          "Aneka Tani Balikpapan",
          "Rp150.000",
          "Donasi Lagi",
          ButtonType.primary,
        ),
        const SizedBox(height: 15),
        _buildProjectCard(
          "Closed",
          "Gerakan 1000 Pohon Mangrove Kariangau",
          "Aneka Tani Balikpapan",
          "Rp150.000",
          "Menunggu LPJ",
          ButtonType.textIcon,
        ),
        const SizedBox(height: 15),
        _buildProjectCard(
          "Closed",
          "Gerakan 1000 Pohon Mangrove Kariangau",
          "Aneka Tani Balikpapan",
          "Rp150.000",
          "Unduh LPJ",
          ButtonType.secondary,
        ),
      ],
    );
  }

  Widget _buildProjectCard(
    String status,
    String title,
    String location,
    String donationAmount,
    String actionText,
    ButtonType buttonType,
  ) {
    final isClosed = status == "Closed";

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Tanggal & Badge Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 14,
                    color: isClosed ? Colors.red : Colors.redAccent,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Close Date : 20 Feb 2026",
                    style: TextStyle(
                      fontSize: 10,
                      color: isClosed ? Colors.red : Colors.redAccent,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isClosed ? Colors.red : Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Content Image & Text
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[300], // Placeholder Image
                  child: const Icon(Icons.image, color: Colors.grey),
                  // Ganti child di atas dengan: Image.asset("assets/...", fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 12,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Footer Amount & Button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Total Donasi 5 Pohon: $donationAmount",
                    style: const TextStyle(fontSize: 10, color: Colors.green),
                  ),
                  const SizedBox(height: 8),
                  if (buttonType == ButtonType.primary)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        minimumSize: const Size(0, 30),
                      ),
                      onPressed: () {},
                      child: Text(
                        actionText,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    )
                  else if (buttonType == ButtonType.secondary)
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 0,
                        ),
                        minimumSize: const Size(0, 30),
                      ),
                      onPressed: () {},
                      icon: const Text(
                        "📥",
                        style: TextStyle(fontSize: 12),
                      ), // Placeholder icon download
                      label: Text(
                        actionText,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            actionText,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.timer_outlined, size: 16),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Enum untuk tipe tombol di card project
enum ButtonType { primary, secondary, textIcon }
