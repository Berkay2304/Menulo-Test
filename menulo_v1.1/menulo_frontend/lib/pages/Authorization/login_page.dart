import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Login",
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gabarito',
                ),
              ),
              const SizedBox(height: 48),

              _buildInputLabel("E-mail"),
              const SizedBox(height: 4),
              TextField(
                decoration: _buildInputDecoration(
                  hint: "Enter your email",
                  icon: Icons.email_outlined,
                ),
              ),

              const SizedBox(height: 24),

              _buildInputLabel("Password"),
              const SizedBox(height: 4),
              TextField(
                obscureText: true,
                decoration: _buildInputDecoration(
                  hint: "Enter your password",
                  icon: Icons.lock_outline,
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => debugPrint("Forgot Password"),
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16, fontFamily: 'Gabarito'),
                ),
              ),

              const SizedBox(height: 48),

              const Text(
                "or login with",
                style: TextStyle(color: Colors.black54, fontFamily: 'Gabarito'),
              ),
              const SizedBox(height: 16),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black12, width: 2),
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => debugPrint("Sign in with Google"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/google.png", height: 24),
                    const SizedBox(width: 12),
                    const Text(
                      "Login with Google",
                      style: TextStyle(fontSize: 16, fontFamily: 'Gabarito'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.textDark,
          fontFamily: 'Gabarito',
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black54, fontFamily: 'Gabarito'),
      prefixIcon: Icon(icon),
      prefixIconColor: Colors.black54,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black26),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.brandColor, width: 2),
      ),
    );
  }
}