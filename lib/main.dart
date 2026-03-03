import 'package:flutter/material.dart';
import 'package:tanamin_mobile_1/features/profile/presentation/pages/edit_email_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const EditEmailPage());
  }
}
