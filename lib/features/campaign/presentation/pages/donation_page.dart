import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  // Warna Utama
  final Color _primaryGreen = const Color(0xFF0F5736); // Hijau Gelap Tanamin
  final Color _accentGreen = const Color(
    0xFF00C853,
  ); // Hijau Cerah (Tombol/Progress)
  final Color _textGreen = const Color(0xFF1B8E67); // Hijau Teks Impact

  // Controller Input
  final TextEditingController _treeCountController = TextEditingController(
    text: "10",
  );
  final TextEditingController _totalPriceController = TextEditingController(
    text: "Rp 300.000",
  );

  @override
  void initState() {
    super.initState();
    // Lock Portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.05; // 5% padding

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Background sedikit abu-abu
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Donasi",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 1. Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section: Kampanye Dipilih
                  _buildSectionTitle("Kampanye yang dipilih"),
                  const SizedBox(height: 10),
                  _buildCampaignCard(),
                  const SizedBox(height: 25),

                  // Section: Masukkan Donasi
                  _buildSectionTitle("Masukkan Donasi"),
                  const SizedBox(height: 10),
                  _buildDonationInputs(),
                  const SizedBox(height: 5),
                  Text(
                    "*masukkan jumlah pohon yang ingin anda donasikan, total harga dihitung secara otomatis",
                    style: TextStyle(color: Colors.red[400], fontSize: 10),
                  ),
                  const SizedBox(height: 25),

                  // Section: Metode Pembayaran
                  _buildSectionTitle("Pilih Metode Pembayaran"),
                  const SizedBox(height: 10),
                  _buildPaymentMethodCard(),
                  const SizedBox(height: 25),

                  // Section: Dampak Donasi
                  _buildImpactCard(),
                  const SizedBox(height: 25),

                  // Section: Rincian Pembayaran
                  _buildPaymentDetailsCard(),

                  // Extra space di bawah agar tidak tertutup tombol
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // 2. Bottom Action Button (Fixed)
          _buildBottomButton(paddingHorizontal),
        ],
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildCampaignCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Date & Location
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 12,
                    color: Colors.red[400],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Close Date : 20 Feb 2026",
                    style: TextStyle(fontSize: 10, color: Colors.red[400]),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    size: 12,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Aneka Tani Balikpapan",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Image & Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://picsum.photos/100/100", // Placeholder Image
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Lorem ipsum dolor sit amet consectetur adipiscing elit.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Rp 10.000/bibit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Progress Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "320/1000",
                style: TextStyle(color: _accentGreen, fontSize: 12),
              ),
              Text("80%", style: TextStyle(color: _accentGreen, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: 0.8,
              minHeight: 6,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(_accentGreen),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationInputs() {
    return Row(
      children: [
        // Input Jumlah Pohon
        Expanded(
          flex: 4,
          child: _buildInputBox(
            label: "Jumlah Pohon",
            controller: _treeCountController,
          ),
        ),
        const SizedBox(width: 15),
        // Input Total Harga
        Expanded(
          flex: 6,
          child: _buildInputBox(
            label: "Total Harga",
            controller: _totalPriceController,
            readOnly: true, // Biasanya otomatis terhitung
          ),
        ),
      ],
    );
  }

  Widget _buildInputBox({
    required String label,
    required TextEditingController controller,
    bool readOnly = false,
  }) {
    return Stack(
      children: [
        Container(
          height: 55,
          margin: const EdgeInsets.only(
            top: 8,
          ), // Space untuk label floating (opsional style)
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  readOnly: readOnly,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              const Icon(Icons.cancel_outlined, size: 20, color: Colors.grey),
            ],
          ),
        ),
        // Label Floating Effect (Background putih agar menutupi border)
        Positioned(
          left: 10,
          top: 0,
          child: Container(
            color: const Color(
              0xFFF8F9FA,
            ), // Samakan dengan background Scaffold
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              label,
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Logo Dana Dummy
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.blue, // Placeholder warna Dana
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            "Dana",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const Spacer(),
          Text(
            "edit",
            style: TextStyle(
              color: Colors.blue[700],
              decoration: TextDecoration.underline,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImpactCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dampak Donasi",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildImpactItem("12", "Pohon\ntertanam"),
              _buildImpactItem("2", "Petani\nDiberdayakan"),
              _buildImpactItem("0.2 ha", "Lahan\nDihijaukan"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImpactItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            color: _primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: _accentGreen, fontSize: 11, height: 1.2),
        ),
      ],
    );
  }

  Widget _buildPaymentDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Rincian Pembayaran",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 15),
          _buildDetailRow("Jumlah Donasi", "Rp 300.000"),
          const SizedBox(height: 8),
          _buildDetailRow("Biaya Admin", "Rp 2.000"),
          const SizedBox(height: 8),
          _buildDetailRow("Biaya Aplikasi", "Rp 2.000"),
          const SizedBox(height: 12),
          const Divider(thickness: 1),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Total Pembayaran",
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              Text(
                "Rp 304.000",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black54, fontSize: 13),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildBottomButton(double paddingHorizontal) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        paddingHorizontal,
        15,
        paddingHorizontal,
        30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white, // Container hitam di bawah sesuai gambar
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _accentGreen, // Tombol Hijau Cerah
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Lanjutkan Pembayaran",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.payment, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
