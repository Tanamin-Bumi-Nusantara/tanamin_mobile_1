import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controller untuk menangkap input (Opsional, disiapkan untuk logic)
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Warna Utama sesuai desain (Hijau Tanamin)
  final Color _primaryGreen = const Color(0xFF0F5736);

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
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.06; // 6% padding kiri-kanan

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                "Buat Akun Anda",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _primaryGreen,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Buat sebuah akun baru untuk mulai menikmati semua fitur kami.",
                style: TextStyle(
                  fontSize: 14,
                  color: _primaryGreen.withOpacity(0.7),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 25),

              // 3. Form Fields
              _buildCustomTextField(
                label: "Email",
                helperText: "Masukkan email pribadi anda",
                controller: _emailController,
              ),
              const SizedBox(height: 15),
              _buildCustomTextField(
                label: "Nama",
                helperText: "Masukkan lengkap anda",
                controller: _nameController,
              ),
              const SizedBox(height: 15),
              _buildCustomTextField(
                label: "Password",
                helperText: "Masukkan password anda (min. 8 karakter)",
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 15),
              _buildCustomTextField(
                label: "Konfirmasi Password",
                helperText: "Masukkan ulang password anda",
                controller: _confirmPasswordController,
                isPassword: true,
              ),
              const SizedBox(height: 30),

              // 4. Register Button
              SizedBox(
                width: double.infinity,
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Action Daftar
                  },
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // 5. Login Link
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Sudah punya akun Tanamin? ",
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    children: [
                      TextSpan(
                        text: "Masuk disini",
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigasi ke Login Page
                            // Navigator.pop(context);
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
                  _buildSocialButton("G", Colors.black), // Google placeholder
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    "f",
                    Colors.blue[800]!,
                  ), // Facebook placeholder
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    "in",
                    Colors.blue[900]!,
                  ), // LinkedIn placeholder
                ],
              ),
              const SizedBox(height: 30),

              // 8. Footer Terms
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Dengan mendaftar, anda setuju dengan ",
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
        // Logo Placeholder (Icon + Text)
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
        // Empty SizedBox agar Logo benar-benar di tengah (menyeimbangkan icon back)
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
              // Icon 'X' dalam lingkaran (sesuai gambar)
              GestureDetector(
                onTap: () => controller.clear(),
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.grey[600],
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
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

  Widget _buildSocialButton(String text, Color color) {
    // Menggunakan Container dengan Text sebagai placeholder logo
    // Nanti bisa diganti Image.asset(...)
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'serif', // Placeholder style agar mirip logo
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
