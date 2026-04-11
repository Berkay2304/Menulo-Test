import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isCustomer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Text(
                "Register",
                style: TextStyle(
                  color: Color(0xFF2D3142),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(child: _buildSwitchButton("Customer", isCustomer)),
                    Expanded(child: _buildSwitchButton("Business", !isCustomer)),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              if (isCustomer) _buildCustomerForm() else _buildBusinessForm(),

              const SizedBox(height: 32),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA63B),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                },
                child: const Text("Create Account", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),

              const SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black54, fontSize: 13, height: 1.5),
                    children: [
                      const TextSpan(text: "By continuing, you agree to our "),
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(color: Colors.blue.shade400, fontWeight: FontWeight.w600),
                      ),
                      const TextSpan(text: " and "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(color: Colors.blue.shade400, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black12, width: 2),
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => print("Sign in with Google"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/google.png", height: 24),
                    const SizedBox(width: 12),
                    const Text("Register with Google", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildSwitchButton(String title, bool isActive) {
    return GestureDetector(
      onTap: () => setState(() => isCustomer = (title == "Customer")),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isActive 
            ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))] 
            : [],
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? const Color(0xFFFFA63B) : Colors.black45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerForm() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _customInput("First Name", "John")),
            const SizedBox(width: 16),
            Expanded(child: _customInput("Last Name", "Doe")),
          ],
        ),
        const SizedBox(height: 16),
        _customInput("Phone Number", "+90 (512) 234 56 78"),
        const SizedBox(height: 16),
        _customInput("E-mail", "Enter your email"),
        const SizedBox(height: 16),
        _customInput("Password", "*********", isPass: true, subText: "must contain 8 char."),
        const SizedBox(height: 16),
        _customInput("Confirm Password", "*********", isPass: true),
      ],
    );
  }

  Widget _buildBusinessForm() {
    return Column(
      children: [
        _customInput("Business Name", "Enter your restaurant name"),
        const SizedBox(height: 16),
        _customInput("E-mail", "Enter your email"),
        const SizedBox(height: 16),
        _customInput("Tax Number", "Enter your tax ID"),
        const SizedBox(height: 16),
        _customInput("Address", "Address", maxLines: 2),
        const SizedBox(height: 16),
        _customInput("Password", "*********", isPass: true, subText: "must contain 8 char."),
        const SizedBox(height: 16),
        _customInput("Confirm Password", "*********", isPass: true),
      ],
    );
  }

  Widget _customInput(String label, String hint, {bool isPass = false, String? subText, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2D3142))),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPass,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black26),
            suffixIcon: isPass ? const Icon(Icons.visibility_off_outlined, color: Colors.black26) : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFFFA63B), width: 2),
            ),
          ),
        ),
        if (subText != null) ...[
          const SizedBox(height: 6),
          Text(subText, style: const TextStyle(color: Colors.black38, fontSize: 12)),
        ]
      ],
    );
  }
}