import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Warna Utama (Sesuai desain)
  final Color _primaryGreen = const Color(
    0xFF1B8E67,
  ); // Hijau untuk teks dan ikon
  final Color _bgSection = const Color(
    0xFFF4F5F7,
  ); // Abu-abu muda untuk header section

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
    // Media Query untuk Responsivitas
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.05;

    return Scaffold(
      backgroundColor:
          _bgSection, // Base background diset abu-abu agar area bawah solid
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. HEADER ---
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                paddingHorizontal,
                20,
                paddingHorizontal,
                15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pengaturan Akun",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.search, color: _primaryGreen, size: 26),
                ],
              ),
            ),

            // --- 2. LIST PENGATURAN ---
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  // SECTION: Akun Saya
                  _buildSectionHeader("Akun Saya", paddingHorizontal),
                  _buildMenuItem("Keamanan Akun", paddingHorizontal),
                  _buildMenuItem("Pembayaran", paddingHorizontal),

                  // SECTION: Pengaturan
                  _buildSectionHeader("Pengaturan", paddingHorizontal),
                  _buildMenuItem("Notifikasi", paddingHorizontal),
                  _buildMenuItem("Bahasa / Language", paddingHorizontal),
                  _buildMenuItem("Pengaturan Sistem", paddingHorizontal),

                  // SECTION: Bantuan
                  _buildSectionHeader("Bantuan", paddingHorizontal),
                  _buildMenuItem("Pusat Bantuan", paddingHorizontal),
                  _buildMenuItem("Peraturan Komunitas", paddingHorizontal),
                  _buildMenuItem("Kebijakan", paddingHorizontal),
                  _buildMenuItem(
                    "Suka Tanamin? Nilai Kami!",
                    paddingHorizontal,
                  ),
                  _buildMenuItem("Informasi", paddingHorizontal),

                  // Spacer tambahan di bawah agar nyaman di-scroll
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  /// Header untuk setiap grup pengaturan (Latar abu-abu)
  Widget _buildSectionHeader(String title, double paddingHorizontal) {
    return Container(
      width: double.infinity,
      color: _bgSection,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: 15,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  /// Item menu pengaturan (Latar putih, teks hijau, panah kanan hijau)
  Widget _buildMenuItem(String title, double paddingHorizontal) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          // Aksi navigasi ke halaman detail pengaturan
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: 18,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _primaryGreen, // Teks warna hijau sesuai desain
                ),
              ),
              Icon(
                Icons.arrow_forward_ios, // Ikon panah ke kanan
                color: _primaryGreen,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
