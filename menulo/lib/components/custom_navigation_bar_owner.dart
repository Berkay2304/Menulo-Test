import 'package:flutter/material.dart';
import 'package:menulo/notitiers/page_notifiers.dart';

class CustomNavigationBarOwner extends StatefulWidget {
  const CustomNavigationBarOwner({super.key});

  @override
  State<CustomNavigationBarOwner> createState() =>
      _CustomNavigationBarOwnerState();
}

class _CustomNavigationBarOwnerState extends State<CustomNavigationBarOwner> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentOwnerPage,
      builder: (context, value, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.menu),
              label: "Menu Manager",
            ),
            NavigationDestination(
              icon: Icon(Icons.store),
              label: "My Business",
            ),
          ],
          selectedIndex: currentOwnerPage.value,
          onDestinationSelected: (value) {
            currentOwnerPage.value = value;
          },
        );
      },
    );
  }
}
