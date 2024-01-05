import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, "dash"),);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset('assets/gif/Broadcast.gif'),
        ),
      ),
    );
  }
}
