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
    return ValueListenableBuilder<int>(
      valueListenable: currentOwnerPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.menu),
              label: "Menu Manager",
            ),
            NavigationDestination(
              icon: Icon(Icons.store),
              label: "My Business",
            ),
          ],
          selectedIndex: selectedPage,
          onDestinationSelected: (value) {
            currentOwnerPageNotifier.value = value;
          },
        );
      },
    );
  }
}