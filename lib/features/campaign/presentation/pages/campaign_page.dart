import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({super.key});

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  // State untuk Tab Kategori
  int _selectedIndex = 0;
  final List<String> _categories = [
    "Semua",
    "Open",
    "Closed",
    "Lokasi Terdekat",
  ];

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
    // Media Query Variables
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.05; // 5% padding kiri-kanan

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // 1. Bungkus semuanya dengan SingleChildScrollView agar satu halaman bisa discroll
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // 2. Search Bar & Filter
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: _buildSearchBar(),
              ),
              const SizedBox(height: 15),

              // 3. Category Tabs
              _buildCategoryTabs(paddingHorizontal),
              const SizedBox(height: 10),

              // 4. Grid Campaign
              // Hapus Expanded disini, biarkan grid mengambil tinggi sesuai isinya
              _buildCampaignGrid(paddingHorizontal),

              // 5. Footer "Lihat Selengkapnya"
              // Sekarang tombol ini berada DI BAWAH grid (ikut terscroll)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Lihat Selengkapnya",
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              // Extra space di paling bawah agar tidak mentok
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Cari Kampanye",
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Colors.green[700]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Icon(Icons.filter_list_alt, color: Colors.green[700], size: 28),
      ],
    );
  }

  Widget _buildCategoryTabs(double paddingHorizontal) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 25),
              decoration: BoxDecoration(
                border: isSelected
                    ? const Border(
                        bottom: BorderSide(color: Colors.green, width: 2),
                      )
                    : null,
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.green[700] : Colors.grey[500],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCampaignGrid(double paddingHorizontal) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: 10,
      ),
      // PENTING: Agar grid bisa berada di dalam SingleChildScrollView
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Matikan scroll internal grid

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.60,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildCampaignCard();
      },
    );
  }

  Widget _buildCampaignCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage("https://picsum.photos/400/600"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildBadge("Balikpapan", Colors.white, Colors.black87),
                    const SizedBox(width: 5),
                    _buildBadge("Open", Colors.green, Colors.white),
                  ],
                ),
                const Spacer(),
                const Text(
                  "Penanaman Mangrove Pesisir Balikpapan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "Tanamin Bumi Nusantara",
                  style: TextStyle(color: Colors.grey[300], fontSize: 10),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "320/1000",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    Text(
                      "80%",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const LinearProgressIndicator(
                    value: 0.32,
                    backgroundColor: Colors.white30,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    minHeight: 4,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Rp 10.000/bibit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
