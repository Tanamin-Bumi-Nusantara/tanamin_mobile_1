import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // State untuk Custom Tabs
  int _selectedIndex = 0;
  final List<String> _tabs = ["Dibuka", "Ditutup", "LPJ"];

  // Warna Utama (diambil dari warna hijau terang tombol di desain)
  final Color _primaryGreen = const Color(0xFF00A65A);
  final Color _bgColor = const Color(
    0xFFF4F5F7,
  ); // Warna latar belakang abu-abu

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
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. HEADER (Title & Search Icon) ---
            Padding(
              padding: EdgeInsets.fromLTRB(
                paddingHorizontal,
                20,
                paddingHorizontal,
                10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Riwayat Donasi",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.search, color: _primaryGreen, size: 28),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // --- 2. CUSTOM TABS ---
            Container(
              color: Colors.white, // Latar belakang tab putih
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: Row(
                children: _tabs.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String text = entry.value;
                  bool isSelected = _selectedIndex == idx;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = idx;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        bottom: 12,
                        top: 12,
                        right: 25,
                        left: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected
                                ? _primaryGreen
                                : Colors.transparent,
                            width: 2.5,
                          ),
                        ),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: isSelected ? _primaryGreen : Colors.grey[500],
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // --- 3. LIST VIEW (Riwayat Donasi) ---
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: paddingHorizontal,
                  vertical: 15,
                ),
                itemCount: 5, // Jumlah item dummy
                itemBuilder: (context, index) {
                  return _buildHistoryCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildHistoryCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Tanggal & Badge Status
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
                  const SizedBox(width: 5),
                  Text(
                    "Close Date : 20 Feb 2026",
                    style: TextStyle(fontSize: 11, color: Colors.red[400]),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _primaryGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Open",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Content Row: Image, Judul, Lokasi
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://picsum.photos/150/150", // Placeholder gambar
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Gerakan 1000 Pohon Mangrove Kariangau",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Colors.black87,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Aneka Tani Balikpapan",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Footer: Harga & Tombol Donasi Lagi
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Total Donasi 5 Pohon: Rp150.000",
              style: TextStyle(
                fontSize: 12,
                color: _primaryGreen,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                onPressed: () {
                  // Aksi donasi lagi
                },
                child: const Text(
                  "Donasi Lagi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
