import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({super.key});

  @override
  State<MonitoringPage> createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  // Warna Utama
  final Color _primaryGreen = const Color(0xFF1B8E67); // Hijau khas Tanamin
  final Color _lightGreenBg = const Color(
    0xFFE8F5E9,
  ); // Background header grafik
  final Color _bgColor = const Color(
    0xFFF4F5F7,
  ); // Warna abu-abu pemisah section

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
    // Mengambil ukuran layar untuk responsivitas
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.05;

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
          "Monitoring 20 Desember 2025",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(thickness: 4, color: _bgColor, height: 4),

              // --- SECTION 1: GAMBAR 360 ---
              _buildSectionContainer(
                paddingHorizontal: paddingHorizontal,
                title: "Gambar 360'",
                child: _build360Image(),
              ),

              Divider(thickness: 8, color: _bgColor),

              // --- SECTION 2: PERTUMBUHAN POHON ---
              _buildSectionContainer(
                paddingHorizontal: paddingHorizontal,
                title: "Pertumbuhan Pohon",
                child: _buildChartSection(),
              ),

              Divider(thickness: 8, color: _bgColor),

              // --- SECTION 3: DATA MONITORING ---
              _buildSectionContainer(
                paddingHorizontal: paddingHorizontal,
                title: "Data Monitoring",
                child: _buildDataMonitoringList(),
              ),

              Divider(thickness: 8, color: _bgColor),

              // --- SECTION 4: DOKUMENTASI ---
              _buildSectionContainer(
                paddingHorizontal: paddingHorizontal,
                title: "Dokumentasi",
                child: _buildDocumentationGrid(size),
              ),

              const SizedBox(height: 30), // Extra padding bottom
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET BUILDER COMPONENTS ---

  /// Helper untuk membuat standar container section (Judul + Garis Bawah + Konten)
  Widget _buildSectionContainer({
    required double paddingHorizontal,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }

  /// Widget Gambar 360
  Widget _build360Image() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: NetworkImage("https://picsum.photos/600/300"), // Placeholder
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withOpacity(0.3), // Overlay gelap
        ),
        alignment: Alignment.center,
        child: const Text(
          "gambar 360'",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  /// Widget Grafik Pertumbuhan
  Widget _buildChartSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: _primaryGreen, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Header Grafik
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _lightGreenBg,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            child: const Text(
              "Grafik Pertumbuhan Pohon",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          // Area Grafik (Menggunakan CustomPaint agar tidak butuh library eksternal)
          Container(
            height: 250,
            padding: const EdgeInsets.only(
              top: 20,
              right: 20,
              left: 10,
              bottom: 20,
            ),
            child: CustomPaint(
              size: const Size(double.infinity, 250),
              painter: _TreeGrowthChartPainter(lineColor: _primaryGreen),
            ),
          ),
          // Legend (Keterangan)
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Row(
              children: [
                Container(width: 25, height: 15, color: _primaryGreen),
                const SizedBox(width: 8),
                const Text("Tinggi Pohon", style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget List Data Monitoring
  Widget _buildDataMonitoringList() {
    return Column(
      children: [
        _buildDataRow("Pohon Ditanam", "300"),
        _buildDataRow("Pohon Hidup", "300"),
        _buildDataRow("Pohon Mati", "0"),
        _buildDataRow("Survive Rate", "100 %"),
        _buildDataRow("Lahan Dihijaukan", "1.2 ha"),
        _buildDataRow("Karbon Diserap\n(Tahunan)", "3.2 Ton"),
        _buildDataRow("Rerata Diameter\nBatang", "3.2 cm"),
        _buildDataRow("Rerata Lingkar\nBatang", "6.4 cm"),
        _buildDataRow("Rerata Tinggi\nPohon", "1.5 m"),
        _buildDataRow("Pohon Tertinggi", "1.6 m"),
        _buildDataRow("Pohon Terendah", "1.3 m"),
        _buildDataRow("Umur Pohon", "4 Bulan", isLast: true),
      ],
    );
  }

  /// Format Row Data Monitoring
  Widget _buildDataRow(String label, String value, {bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.park, color: _primaryGreen, size: 18),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(color: _primaryGreen, fontSize: 13),
            ),
          ),
          const Text(" : ", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: _primaryGreen,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget Grid Dokumentasi
  Widget _buildDocumentationGrid(Size size) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap:
              true, // PENTING: Agar grid view bisa berada di dalam SingleChildScrollView
          physics: const NeverScrollableScrollPhysics(), // Matikan scroll grid
          itemCount: 9, // Dummy 9 foto
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.5, // Lebar gambar lebih besar dari tinggi
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                "https://picsum.photos/300/200?random=$index", // Gambar acak
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        // Tombol Lihat Semua
        GestureDetector(
          onTap: () {},
          child: Text(
            "Lihat Semua",
            style: TextStyle(
              color: _primaryGreen,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: _primaryGreen,
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// CUSTOM PAINTER UNTUK GRAFIK PERTUMBUHAN POHON
// ============================================================================
class _TreeGrowthChartPainter extends CustomPainter {
  final Color lineColor;

  _TreeGrowthChartPainter({required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final Paint gridPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1.0;

    final Paint dotPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Padding & Margin Chart
    const double paddingLeft = 30;
    const double paddingBottom = 30;
    final double chartWidth = size.width - paddingLeft;
    final double chartHeight = size.height - paddingBottom;

    // 1. Gambar Grid Horizontal (Y-Axis)
    final List<String> yLabels = [
      "0",
      "0.5",
      "1",
      "1.5",
      "2",
      "2.5",
      "3",
      "3.5",
      "4",
    ];
    final double yStep = chartHeight / (yLabels.length - 1);

    for (int i = 0; i < yLabels.length; i++) {
      double y = chartHeight - (i * yStep);

      // Garis Grid
      canvas.drawLine(Offset(paddingLeft, y), Offset(size.width, y), gridPaint);

      // Label Angka Y
      textPainter.text = TextSpan(
        text: yLabels[i],
        style: TextStyle(color: Colors.grey.shade700, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(paddingLeft - 20, y - 6));
    }

    // 2. Teks Vertikal "Tinggi Pohon (meter)"
    canvas.save();
    canvas.translate(
      paddingLeft + 5,
      chartHeight / 2 + 50,
    ); // Posisikan di tengah sumbu Y
    canvas.rotate(-1.5708); // Rotate -90 derajat
    textPainter.text = TextSpan(
      text: "Tinggi Pohon (meter)",
      style: TextStyle(color: Colors.grey.shade600, fontSize: 10),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(0, 0));
    canvas.restore();

    // 3. Gambar Garis Vertikal (Sumbu Y Utama)
    canvas.drawLine(
      Offset(paddingLeft, 0),
      Offset(paddingLeft, chartHeight),
      Paint()
        ..color = Colors.black54
        ..strokeWidth = 1,
    );

    // 4. Label X-Axis
    final List<String> xLabels = ["Februari 2025", "Juni 2025"];
    final double xStep = chartWidth / (xLabels.length - 1);

    for (int i = 0; i < xLabels.length; i++) {
      double x = paddingLeft + (i * xStep);

      textPainter.text = TextSpan(
        text: xLabels[i],
        style: TextStyle(color: Colors.grey.shade700, fontSize: 10),
      );
      textPainter.layout();

      // Menggeser label agar presisi (kiri di-align kiri, kanan di-align kanan)
      double textOffset = (i == 0) ? x + 5 : x - textPainter.width;
      textPainter.paint(canvas, Offset(textOffset, chartHeight + 10));
    }

    // 5. Gambar Garis Tren (Data Poin)
    // Titik 1: Feb 2025 (Y = 0.5)
    final Offset point1 = Offset(paddingLeft, chartHeight - (1 * yStep));
    // Titik 2: Jun 2025 (Y = 1.5)
    final Offset point2 = Offset(
      paddingLeft + chartWidth,
      chartHeight - (3 * yStep),
    );

    // Gambar Garis
    canvas.drawLine(point1, point2, linePaint);

    // Gambar Titik (Dot)
    canvas.drawCircle(point1, 4, dotPaint);
    canvas.drawCircle(point2, 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
