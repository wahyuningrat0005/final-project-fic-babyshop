
import 'package:baby_shop/presentation/main_navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainNavigationView(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          "Baby Shop",
          style: GoogleFonts.pacifico(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
