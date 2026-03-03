import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectMonitoringsPage extends StatefulWidget {
  const SelectMonitoringsPage({super.key});

  @override
  State<SelectMonitoringsPage> createState() => _SelectMonitoringsPageState();
}

class _SelectMonitoringsPageState extends State<SelectMonitoringsPage> {
  // Warna Utama sesuai gambar
  final Color _primaryGreen = const Color(0xFF1B8E67); // Hijau teks monitoring
  final Color _bgColor = const Color(
    0xFFF4F5F7,
  ); // Abu-abu muda untuk background

  @override
  void initState() {
    super.initState();
    // Memaksa orientasi Portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar untuk responsivitas
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.05; // 5% padding kiri-kanan

    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Monitoring",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle:
            false, // Sesuai desain, title condong ke kiri setelah back button
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Kontainer Putih Utama (Header Kampanye & List Monitoring)
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  paddingHorizontal,
                  20,
                  paddingHorizontal,
                  30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                      16,
                    ), // Lengkungan halus di bagian bawah
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- 1. SECTION: KAMPANYE ---
                    const Text(
                      "Kampanye",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Info Tanggal & Lokasi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 14,
                              color: Colors.red[400],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Close Date : 20 Feb 2026",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.red[400],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Colors.black87,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Aneka Tani Balikpapan",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Gambar & Judul Kampanye
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            "https://picsum.photos/200/200", // Placeholder Gambar Kampanye
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet consectetur adipiscing elit.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const Divider(thickness: 1),
                    const SizedBox(height: 20),

                    // --- 2. SECTION: TANGGAL MONITORING ---
                    const Text(
                      "Tanggal Monitoring",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Kotak List Monitoring
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          _buildMonitoringItem("Monitoring 20 Desember 2025"),
                          Divider(height: 1, color: Colors.grey.shade300),
                          _buildMonitoringItem("Monitoring 20 September 2025"),
                          Divider(height: 1, color: Colors.grey.shade300),
                          _buildMonitoringItem("Monitoring 20 Juni 2025"),
                          Divider(height: 1, color: Colors.grey.shade300),
                          _buildMonitoringItem(
                            "Monitoring 20 Maret 2025",
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Sisa layar akan berwarna background abu-abu (_bgColor)
              // Diberikan spasi bawah agar aman saat discroll
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildMonitoringItem(String title, {bool isLast = false}) {
    return InkWell(
      onTap: () {
        // Aksi ketika item monitoring diklik
        // context.push('/monitoring_detail');
      },
      // Border radius ditambahkan pada item pertama dan terakhir agar efek sentuh (InkWell) tidak keluar kotak
      borderRadius: BorderRadius.vertical(
        top: isLast ? Radius.zero : const Radius.circular(8),
        bottom: isLast ? const Radius.circular(8) : Radius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: _primaryGreen,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            Icon(Icons.arrow_forward, color: _primaryGreen, size: 20),
          ],
        ),
      ),
    );
  }
}
