import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:menulo/components/custom_navigation_bar.dart';
import 'package:menulo/notitiers/page_notifiers.dart';
import 'package:menulo/pages/CustomerSide/Discover/discover_page.dart';
import 'package:menulo/pages/CustomerSide/Favourites/favourites_page.dart';
import 'package:menulo/pages/CustomerSide/MenuBot/menubot_page.dart';
import 'package:menulo/pages/CustomerSide/Profile/profile_page.dart';
import 'package:menulo/pages/CustomerSide/QR/qrscan_page.dart';
import 'package:menulo/pages/CustomerSide/Room/rooms_main_page.dart';

final List<Map<String, dynamic>> pageData = [
  {'title': 'Discover', 'page': const DiscoverPage()},
  {'title': 'Rooms', 'page': const RoomsMainPage()},
  {'title': 'QR Scan', 'page': const QRScanPage()},
  {'title': 'Favourites', 'page': const FavouritesPage()},
  {'title': 'Profile', 'page': const ProfilePage()},
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentCustomerPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          body: pageData.elementAt(selectedPage)["page"] as Widget,
          bottomNavigationBar: const CustomNavigationBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint("FAB clicked");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MenuBotPage();
                  },
                ),
              );
            },
            child: const Center(
              child: FaIcon(FontAwesomeIcons.robot),
            ),
          ),
        );
      },
    );
  }
}