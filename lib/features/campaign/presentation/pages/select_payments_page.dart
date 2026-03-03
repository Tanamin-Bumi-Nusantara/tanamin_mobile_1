import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectPaymentPage extends StatefulWidget {
  const SelectPaymentPage({super.key});

  @override
  State<SelectPaymentPage> createState() => _SelectPaymentPageState();
}

class _SelectPaymentPageState extends State<SelectPaymentPage> {
  // ID Pembayaran yang terpilih (Default: Dana)
  String _selectedPaymentId = 'dana';

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
    final double paddingHorizontal = size.width * 0.05;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Background abu-abu muda
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pilih Pembayaran",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- SECTION 1: E-MONEY ---
              const Text(
                "E-Money",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              _buildPaymentOption(
                id: 'dana',
                title: 'Dana',
                subtitle: 'Saldo Rp 500.000',
                footer: 'Bebas Biaya Admin',
                logoColor: Colors.blue,
                iconData: Icons.account_balance_wallet,
              ),
              const SizedBox(height: 12),
              _buildPaymentOption(
                id: 'gopay',
                title: 'Gopay',
                subtitle: 'Saldo Rp 100.000',
                footer: 'Bebas Biaya Admin',
                logoColor: Colors.lightBlueAccent,
                iconData: Icons.account_balance_wallet,
              ),
              const SizedBox(height: 12),
              _buildPaymentOption(
                id: 'ovo',
                title: 'OVO',
                subtitle: 'Saldo Rp 50.000',
                footer: 'Bebas Biaya Admin',
                logoColor: Colors.purple,
                iconData: Icons.circle,
              ),

              const SizedBox(height: 25),

              // --- SECTION 2: TRANSFER BANK ---
              const Text(
                "Transfer Bank",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Bank Mandiri
              _buildPaymentOption(
                id: 'mandiri',
                title: 'Mandiri', // Placeholder logo text
                isBank: true,
                adminFee: 'Rp 1000',
                logoAsset: 'assets/images/mandiri.png', // Contoh path asset
                logoColor: Colors.blue[900]!,
              ),
              const SizedBox(height: 12),

              // BNI
              _buildPaymentOption(
                id: 'bni',
                title: 'BNI',
                isBank: true,
                adminFee: 'Rp 1000',
                logoColor: Colors.orange[800]!,
              ),
              const SizedBox(height: 12),

              // BCA
              _buildPaymentOption(
                id: 'bca',
                title: 'BCA',
                isBank: true,
                adminFee: 'Rp 1000',
                logoColor: Colors.blue[800]!,
              ),
              const SizedBox(height: 12),

              // BRI
              _buildPaymentOption(
                id: 'bri',
                title: 'BANK BRI',
                isBank: true,
                adminFee: 'Rp 1000',
                logoColor: Colors.blue[700]!,
              ),
              const SizedBox(height: 12),

              // BSI
              _buildPaymentOption(
                id: 'bsi',
                title: 'BSI',
                isBank: true,
                adminFee: 'Rp 1000',
                logoColor: Colors.teal[700]!,
              ),
              const SizedBox(height: 12),

              // Mandiri Syariah
              _buildPaymentOption(
                id: 'mandiri_syariah',
                title: 'Mandiri Syariah',
                isBank: true,
                adminFee: 'Rp 1000',
                logoColor: Colors.green[800]!,
              ),

              // Spacer bawah agar tidak mentok
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET BUILDER ---

  Widget _buildPaymentOption({
    required String id,
    required String title,
    String? subtitle,
    String? footer,
    bool isBank = false,
    String? adminFee,
    String? logoAsset, // Opsional jika punya aset gambar
    required Color logoColor, // Placeholder warna logo
    IconData? iconData,
  }) {
    final bool isSelected = _selectedPaymentId == id;

    // Warna Border: Biru jika dipilih, Abu-abu jika tidak
    final Color borderColor = isSelected ? Colors.blue : Colors.grey.shade300;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentId = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: [
            // 1. LOGO AREA
            // Karena tidak ada aset asli, saya gunakan Container berwarna sebagai placeholder logo
            Container(
              width: 50,
              height: 35,
              decoration: BoxDecoration(
                // Jika punya gambar, ganti color dengan image: DecorationImage(...)
                color: Colors.white,
              ),
              alignment: Alignment.centerLeft,
              child: logoAsset != null
                  ? Image.asset(logoAsset, fit: BoxFit.contain)
                  : Text(
                      title,
                      style: TextStyle(
                        color: logoColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
            ),

            const SizedBox(width: 15),

            // 2. TEXT CONTENT
            Expanded(
              child: isBank
                  ? Row(
                      // Layout khusus Bank (Kiri Kosong, Kanan Biaya)
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Biaya Penanganan",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              adminFee ?? "-",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      // Layout E-Money (Judul, Saldo, Footer)
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "$title  ",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: subtitle,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          footer ?? "",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
            ),

            const SizedBox(width: 10),

            // 3. RADIO BUTTON (Custom)
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey,
                  width: 2,
                ),
                color: Colors.white,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
