import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/onboarding_page.dart';
import 'screens/home_page.dart'; // sekalian import ini buat jaga-jaga

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS Toko Online',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/onboarding': (context) => const OnboardingPage(),
      },
    );
  }
}
