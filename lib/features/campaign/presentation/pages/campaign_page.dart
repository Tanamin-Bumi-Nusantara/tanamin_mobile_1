import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/campaign_bloc.dart';
import '../blocs/campaign_event.dart';
import '../blocs/campaign_state.dart';
import '../../domain/entities/campaign.dart';

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
    context.read<CampaignBloc>().add(FetchCampaignsEvent());
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

              // 1. Search Bar & Filter
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: _buildSearchBar(),
              ),
              const SizedBox(height: 15),

              // 2. BLOC BUILDER UNTUK GRID VIEW
              BlocBuilder<CampaignBloc, CampaignState>(
                builder: (context, state) {
                  if (state is CampaignLoading) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.green),
                      ),
                    );
                  } else if (state is CampaignLoaded) {
                    final campaigns = state.campaigns;
                    return _buildCampaignGrid(campaigns); // Kirim data ke grid
                  } else if (state is CampaignError) {
                    return Center(child: Text(state.message));
                  }

                  return const SizedBox(); // State awal
                },
              ),

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

  // 2. TERIMA DATA LIST DI GRID
  Widget _buildCampaignGrid(List<Campaign> campaigns) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.60,
      ),
      itemCount: campaigns.length, // Dinamis sesuai jumlah JSON
      itemBuilder: (context, index) {
        return _buildCampaignCard(campaigns[index]); // Render per item
      },
    );
  }

  // 3. RENDER DATA ENTITY KE DALAM CARD
  Widget _buildCampaignCard(Campaign campaign) {
    // Menghitung progress persentase (Contoh: 320 / 1000 = 0.32)
    final double progress = campaign.numberOfTrees / campaign.targetTrees;
    final String progressPercent = "${(progress * 100).toInt()}%";

    // Format harga sederhana
    final String formattedPrice =
        "Rp ${campaign.pricePerTree.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          // Ganti ke AssetImage jika gambar ada di lokal, atau NetworkImage jika URL internet
          image: NetworkImage(
            "https://picsum.photos/400/600",
          ), // Biarkan placeholder jika asset lokal belum ada
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
                    // MENGGUNAKAN DATA JSON
                    Flexible(
                      child: _buildBadge(
                        campaign.regency,
                        Colors.white,
                        Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 5),
                    _buildBadge(
                      campaign.status.toUpperCase(),
                      Colors.green,
                      Colors.white,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  campaign.title, // MENGGUNAKAN DATA JSON
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // MENGGUNAKAN DATA JSON
                    Text(
                      "${campaign.numberOfTrees}/${campaign.targetTrees}",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    Text(
                      progressPercent,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress, // MENGGUNAKAN DATA JSON
                    backgroundColor: Colors.white30,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.green,
                    ),
                    minHeight: 4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$formattedPrice/bibit", // MENGGUNAKAN DATA JSON
                  style: const TextStyle(
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
        textAlign: TextAlign.center, // Tambahkan ini agar rapi saat 2 baris
        style: TextStyle(
          color: textColor,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
