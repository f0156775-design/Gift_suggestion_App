import 'dart:async';
import 'package:flutter/material.dart';
import '../wishlist_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WishlistScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // بس وائٹ
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 220,
          width: 220,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}