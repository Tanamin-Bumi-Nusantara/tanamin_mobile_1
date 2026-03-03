import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditEmailPage extends StatefulWidget {
  const EditEmailPage({super.key});

  @override
  State<EditEmailPage> createState() => _EditEmailPageState();
}

class _EditEmailPageState extends State<EditEmailPage> {
  // Controller dengan nilai awal sesuai gambar
  final TextEditingController _emailController = TextEditingController(
    text: "user@tanaminbumi.com",
  );

  // Warna Utama (Hijau cerah sesuai desain tombol)
  final Color _primaryGreen = const Color(0xFF00B368);

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
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Media Query untuk Responsivitas
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.05; // 5% padding kiri-kanan

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Email",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false, // Title berada di samping back button
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center untuk tombol
            children: [
              // --- 1. TEXT FIELD ---
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 18,
                  ),
                  // Border saat normal
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                  // Border saat diklik (focus)
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.black54,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // --- 2. HELPER TEXT ---
              Text(
                "Akun email pribadi anda menjadi akun email perwakilan untuk perusahaan anda. Pastikan perusahaan anda sudah mengetahui hal ini.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                  height: 1.4, // Jarak spasi antar baris
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 30),

              // --- 3. TOMBOL SIMPAN ---
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryGreen,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Melengkung
                  ),
                ),
                onPressed: () {
                  // Aksi simpan data
                },
                child: const Text(
                  "Simpan Data",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),

              // Extra space bawah
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
