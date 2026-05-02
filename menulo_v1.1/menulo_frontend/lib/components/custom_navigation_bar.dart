import 'package:flutter/material.dart';
import 'package:menulo/Theme/theme.dart';
import 'package:menulo/notitiers/page_notifiers.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentCustomerPageNotifier,
      builder: (context, selectedPage, child) {
        return Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            NavigationBar(
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.place),
                  label: "Discover",
                ),
                NavigationDestination(
                  icon: Icon(Icons.meeting_room),
                  label: "Rooms",
                ),
                NavigationDestination(
                  icon: SizedBox.shrink(),
                  label: "",
                  enabled: false,
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite),
                  label: "Favourites",
                ),
                NavigationDestination(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
              onDestinationSelected: (value) {
                currentCustomerPageNotifier.value = value;
              },
              selectedIndex: selectedPage,
              indicatorColor: selectedPage == 2 ? Colors.transparent : null,
            ),
            Positioned(
              top: -25,
              child: GestureDetector(
                onTap: () {
                  debugPrint("QR Scanned!");
                  currentCustomerPageNotifier.value = 2;
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.brandColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: selectedPage == 2
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.black12,
                        blurRadius: selectedPage == 5 ? 20 : 10,
                        spreadRadius: selectedPage == 5 ? 5 : 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: const Icon(
                    Icons.qr_code,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}