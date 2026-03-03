import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Warna Utama (diambil dari desain)
  final Color _primaryGreen = const Color(0xFF1B8E67); // Hijau ikon & link teks
  final Color _bgSection = const Color(
    0xFFF4F5F7,
  ); // Latar abu-abu untuk header bulan

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
    // Media Query untuk Responsivitas
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. HEADER (Title & Download Icon) ---
            Padding(
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
                    "Notifikasi",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.file_download_outlined,
                    color: Colors.black87,
                    size: 26,
                  ),
                ],
              ),
            ),

            // --- 2. SEARCH BAR ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(Icons.search, color: _primaryGreen, size: 22),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Cari Notifikasi",
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.filter_alt_outlined,
                      color: _primaryGreen,
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- 3. LIST NOTIFIKASI ---
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  // Group: Januari 2026
                  _buildMonthHeader("Januari 2026", paddingHorizontal),
                  _buildNotificationItem(
                    paddingHorizontal: paddingHorizontal,
                    title: "Kampanye anda sudah ber-LPJ",
                    dateText: "22 Jan 2026 - 15.05",
                    imagePath: "https://picsum.photos/100/100?random=1",
                    richDescription: _buildRichText(
                      text1: "Kampanye ",
                      link1: "lorem ipsum",
                      text2: " dengan jumlah donasi sebesar ",
                      link2: "xx",
                      text3: " anda sudah ber-LPJ. Cek LPJ disini.",
                    ),
                  ),
                  _buildNotificationItem(
                    paddingHorizontal: paddingHorizontal,
                    title: "Donasi anda berhasil",
                    dateText: "2 Jan 2026 - 10.05",
                    imagePath: "https://picsum.photos/100/100?random=2",
                    richDescription: _buildRichText(
                      text1: "Donasi anda pada Kampanye ",
                      link1: "lorem ipsum",
                      text2: " dengan jumlah donasi sebesar ",
                      link2: "xx",
                      text3: " berhasil. Cek detail lengkapnya disini.",
                    ),
                  ),

                  // Group: Desember 2025
                  _buildMonthHeader("Desember 2025", paddingHorizontal),
                  _buildNotificationItem(
                    paddingHorizontal: paddingHorizontal,
                    title: "Kampanye anda sudah ber-LPJ",
                    dateText: "12 Des 2025 - 15.05",
                    imagePath: "https://picsum.photos/100/100?random=3",
                    richDescription: _buildRichText(
                      text1: "Kampanye ",
                      link1: "lorem ipsum",
                      text2: " dengan jumlah donasi sebesar ",
                      link2: "xx",
                      text3: " anda sudah ber-LPJ. Cek LPJ disini.",
                    ),
                  ),

                  // Group: Oktober 2025
                  _buildMonthHeader("Oktober 2025", paddingHorizontal),
                  _buildNotificationItem(
                    paddingHorizontal: paddingHorizontal,
                    title: "Kampanye anda sudah ber-LPJ",
                    dateText: "12 Okt 2025 - 15.05",
                    imagePath: "https://picsum.photos/100/100?random=4",
                    richDescription: _buildRichText(
                      text1: "Kampanye ",
                      link1: "lorem ipsum",
                      text2: " dengan jumlah donasi sebesar ",
                      link2: "xx",
                      text3: " anda sudah ber-LPJ. Cek LPJ disini.",
                    ),
                  ),

                  // Spacer bawah agar aman
                  Container(height: 50, color: _bgSection),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  /// Header Bulan (Area dengan background abu-abu muda)
  Widget _buildMonthHeader(String monthText, double paddingHorizontal) {
    return Container(
      width: double.infinity,
      color: _bgSection,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: 15,
      ),
      child: Text(
        monthText,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  /// Item Notifikasi (Gambar di kiri, teks di kanan)
  Widget _buildNotificationItem({
    required double paddingHorizontal,
    required String title,
    required Widget richDescription,
    required String dateText,
    required String imagePath,
  }) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Notifikasi
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          // Area Teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                richDescription,
                const SizedBox(height: 10),
                Text(
                  dateText,
                  style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Helper untuk membuat RichText (Teks hitam dengan link hijau)
  Widget _buildRichText({
    required String text1,
    required String link1,
    required String text2,
    required String link2,
    required String text3,
  }) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.grey[800], fontSize: 12, height: 1.4),
        children: [
          TextSpan(text: text1),
          TextSpan(
            text: link1,
            style: TextStyle(color: _primaryGreen),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Aksi ketika text hijau (kampanye) diklik
              },
          ),
          TextSpan(text: text2),
          TextSpan(
            text: link2,
            style: TextStyle(color: _primaryGreen),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Aksi ketika nominal hijau diklik
              },
          ),
          TextSpan(text: text3),
        ],
      ),
    );
  }
}
