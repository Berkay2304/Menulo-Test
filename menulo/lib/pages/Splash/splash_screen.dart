import 'package:flutter/material.dart';
import 'package:menulo/pages/Authorization/login_page.dart';
import 'package:menulo/pages/Authorization/register_page.dart';
import 'package:menulo/pages/home_page_customer.dart';
import 'package:menulo/pages/home_page_owner.dart';
// import 'package:menulo/pages/main_layout.dart'; // Müşteri ana sayfanın ismini kontrol et

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // --- DEBUG MODE PANELİ (En Üstte) ---
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  const Text(
                    "DEBUG MODE",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _debugButton(
                          context,
                          "Login as Owner",
                          Colors.blueGrey,
                          const HomePageOwner(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _debugButton(
                          context,
                          "Login as Customer",
                          Theme.of(context).primaryColor,
                          const HomePage(), // Buraya müşteri ana sayfanı (örn: MainLayout()) yaz
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // --- ORİJİNAL SPLASH İÇERİĞİ ---
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 5),
              Stack(
                alignment: AlignmentGeometry.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Image.asset("assets/images/menulo_logo.png"),
                  ),
                  Positioned(
                    bottom: 16,
                    child: Text(
                      "All Menus, One App...",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(minimumSize: const Size(144, 0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text("Register"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: const Size(144, 0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black12, width: 2),
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  print("Sign With Google");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/google.png", height: 24),
                      const SizedBox(width: 8),
                      const Text("Login with Google"),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }

  // Debug Butonları İçin Yardımcı Metot
  Widget _debugButton(BuildContext context, String label, Color color, Widget targetPage) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 35),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Text(label),
    );
  }
}