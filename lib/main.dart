import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:tanamin_mobile_1/features/campaign/presentation/pages/campaign_page.dart';

// Import injection container kamu (sesuaikan path-nya jika berbeda)
import 'package:tanamin_mobile_1/injection_container.dart' as di;

import 'features/campaign/presentation/blocs/campaign_bloc.dart';

void main() async {
  // 1. Wajib dipanggil karena kita melakukan proses async sebelum runApp
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Inisialisasi Dependency Injection (GetIt)
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 3. Daftarkan BLoC di sini menggunakan BlocProvider
      home: BlocProvider(
        // Mengambil instance CampaignBloc dari Dependency Injection (GetIt)
        create: (context) => di.sl<CampaignBloc>(),
        child: const CampaignPage(),
      ),
    );
  }
}
