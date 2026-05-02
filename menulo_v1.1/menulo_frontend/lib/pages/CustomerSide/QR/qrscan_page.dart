import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';
import 'package:menulo/notitiers/page_notifiers.dart';
import 'package:menulo/pages/CustomerSide/home_page_customer.dart';

class QRScanPage extends StatelessWidget {
  const QRScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.black87),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.brandColor,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Scan the QR Code to Join",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gabarito',
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  if (Navigator.of(context, rootNavigator: true).canPop()) {
                    Navigator.of(context, rootNavigator: true).pop();
                  } else {
                    currentCustomerPageNotifier.value = 1;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  }
                },
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Enter Code Manually",
                  style: TextStyle(
                    color: AppColors.brandColor,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Gabarito',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}