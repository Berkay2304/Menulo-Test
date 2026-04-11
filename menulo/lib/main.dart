import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';
import 'package:menulo/pages/Splash/splash_screen.dart';

void main() {
  runApp(const MenuloApp());
}

class MenuloApp extends StatelessWidget {
  const MenuloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menulo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: SplashScreen()),
    );
  }
}
