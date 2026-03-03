import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk menangkap input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Warna Utama sesuai desain
  final Color _primaryGreen = const Color(0xFF0F5736);
  final Color _accentGreen = const Color(
    0xFF1B8E67,
  ); // Warna hijau teks subtitle

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
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar untuk responsivitas
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.06; // 6% padding kiri-kanan

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // BouncingScrollPhysics memberikan efek "membal" saat mentok scroll (iOS style)
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header (Back Button & Logo)
              _buildHeader(),
              const SizedBox(height: 25),

              // 2. Title Section
              Text(
                "Masuk ke Akun Anda",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _primaryGreen,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Masukkan email dan password anda untuk mengakses akun dan layanan anda",
                style: TextStyle(
                  fontSize: 14,
                  color: _accentGreen, // Hijau yang lebih terang sesuai gambar
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 30),

              // 3. Form Fields
              _buildCustomTextField(
                label: "Email",
                helperText: "Masukkan email pribadi anda",
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              _buildCustomTextField(
                label: "Password",
                helperText: "Masukkan password anda (min. 8 karakter)",
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 30),

              // 4. Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Action Login
                  },
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // 5. Register Link
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Belum punya akun Tanamin? ",
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    children: [
                      TextSpan(
                        text: "Daftar disini",
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigasi ke Register Page
                            // Navigator.pushNamed(context, '/register');
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 6. Divider "atau"
              Row(
                children: [
                  Expanded(child: Divider(color: _primaryGreen, thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "atau",
                      style: TextStyle(
                        color: _primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: _primaryGreen, thickness: 1)),
                ],
              ),
              const SizedBox(height: 20),

              // 7. Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton("G", Colors.black), // Google
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    "f",
                    Colors.black,
                  ), // Facebook icon di desain hitam/gelap
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    "in",
                    Colors.black,
                  ), // LinkedIn icon di desain hitam/gelap
                ],
              ),
              const SizedBox(height: 40),

              // 8. Footer Terms (Disclaimer)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Dengan masuk, anda setuju dengan ",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 11,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: "Terms of Service\n",
                        style: TextStyle(
                          color: _primaryGreen,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: "dan "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          color: _primaryGreen,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: " kami."),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        // Logo Tanamin (Icon + Text)
        Row(
          children: [
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
        ),
        // Dummy box agar logo berada di tengah (balancing back button)
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _buildCustomTextField({
    required String label,
    required String helperText,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: label,
                    hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              // Tombol X untuk clear text
              GestureDetector(
                onTap: () => controller.clear(),
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.grey[600],
                  size: 22,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        // Helper text di luar kotak input (sesuai desain)
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            helperText,
            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String text, Color iconColor) {
    // Placeholder untuk tombol sosial media
    // Menggunakan background mint/biru muda tipis sesuai desain
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5F1), // Warna background icon muda
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'serif',
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: iconColor,
        ),
      ),
    );
  }
}
