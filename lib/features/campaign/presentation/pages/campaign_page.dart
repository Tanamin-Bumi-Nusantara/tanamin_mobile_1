import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Imports BLoC
import '../blocs/campaign_bloc.dart';
import '../blocs/campaign_event.dart';
import '../blocs/campaign_state.dart';

// Imports Widgets
import '../widgets/campaign/campaign_search_bar.dart';
import '../widgets/campaign/campaign_card.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({super.key});

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  // Catatan: Variabel Tab dan Kategorinya bisa kamu pertahankan di sini
  // jika nanti ingin digunakan lagi.

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Memicu pemanggilan API/JSON saat halaman dibuka
    context.read<CampaignBloc>().add(FetchCampaignsEvent());
  }

  @override
  Widget build(BuildContext context) {
    // Media Query Variables
    final size = MediaQuery.of(context).size;
    final double paddingHorizontal = size.width * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // 1. Search Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: const CampaignSearchBar(), // Menggunakan Widget Terpisah
              ),
              const SizedBox(height: 15),

              // 2. BlocBuilder untuk Grid View
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

                    // Render Grid menggunakan CampaignCard Terpisah
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.60,
                          ),
                      itemCount: campaigns.length,
                      itemBuilder: (context, index) {
                        return CampaignCard(campaign: campaigns[index]);
                      },
                    );
                  } else if (state is CampaignError) {
                    return Center(child: Text(state.message));
                  }

                  return const SizedBox();
                },
              ),

              // 3. Footer "Lihat Selengkapnya"
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

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
