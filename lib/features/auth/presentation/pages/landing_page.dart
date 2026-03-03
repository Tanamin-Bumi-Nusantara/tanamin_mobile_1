import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
    // Mengambil ukuran layar
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
      // Body menggunakan Stack agar Background Image bisa full screen di belakang
      body: Stack(
        children: [
          // 1. Background Image Full Screen dengan Green Tint
          _buildBackgroundImage(screenHeight, screenWidth),

          // 2. Logo Tanamin (Di tengah area hijau)
          Positioned(
            top: screenHeight * 0.35, // Posisi vertikal kira-kira 35% dari atas
            left: 0,
            right: 0,
            child: _buildLogo(),
          ),

          // 3. Bottom Sheet Putih (Konten Utama)
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomSheet(context, screenHeight, screenWidth),
          ),
        ],
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildBackgroundImage(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          // GANTI dengan aset lokal: AssetImage('assets/images/landing_bg.jpg')
          image: const NetworkImage("https://picsum.photos/400/600"),
          fit: BoxFit.cover,
          // Memberikan efek hijau gelap (tint) seperti di desain
          colorFilter: ColorFilter.mode(
            const Color(0xFF0F5736).withOpacity(0.85), // Hijau tua transparansi
            BlendMode.srcOver, // Menumpuk warna di atas gambar
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon Pohon (Placeholder Logo)
        const Icon(
          Icons.forest_outlined, // Bisa diganti Image.asset('assets/logo.png')
          size: 60,
          color: Colors.white,
        ),
        const SizedBox(height: 10),
        // Text "Tanamin"
        const Text(
          "Tanamin",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) {
    // Tinggi Bottom Sheet sekitar 45% dari layar
    final sheetHeight = screenHeight * 0.45;

    return Container(
      height: sheetHeight,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: 20, // 1. Mengurangi padding atas-bawah (sebelumnya 30)
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Judul Utama
          const Text(
            "Tanam pohon pertama\nanda bersama kami",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20, // Sedikit diperkecil agar aman
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10), // Jarak diperpendek
          // Subjudul
          Text(
            "Berkontribusi dengan aksi, hijaukan bumi",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),

          const Spacer(),

          // Tombol Daftar Sekarang
          SizedBox(
            width: double.infinity,
            height: 35, // 2. Tinggi tombol dikurangi (sebelumnya 50)
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F5736),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
              ),
              onPressed: () {
                // context.push('/register');
              },
              child: const Text(
                "Daftar Sekarang",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14, // Font disesuaikan sedikit
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ), // Jarak antar tombol diperpendek (sebelumnya 15)
          // Tombol Masuk
          SizedBox(
            width: double.infinity,
            height: 35, // 2. Tinggi tombol dikurangi (sebelumnya 50)
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF0F5736), width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                // context.push('/login');
              },
              child: const Text(
                "Masuk",
                style: TextStyle(
                  color: Color(0xFF0F5736),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          const Spacer(),

          // Version Text
          Text(
            "Version: 1.0.0",
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
