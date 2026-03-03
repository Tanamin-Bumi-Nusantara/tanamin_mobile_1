import 'package:flutter/material.dart';
import 'package:tanamin_mobile_1/features/campaign/presentation/pages/history_page.dart';
import 'package:tanamin_mobile_1/features/campaign/presentation/pages/monitoring_page.dart';
import 'package:tanamin_mobile_1/features/home/presentation/pages/notifications_page.dart';
import 'package:tanamin_mobile_1/features/home/presentation/pages/settings_page.dart';
import 'package:tanamin_mobile_1/features/profile/presentation/pages/edit_email_page.dart';
import 'package:tanamin_mobile_1/features/profile/presentation/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const EditEmailPage());
  }
}
