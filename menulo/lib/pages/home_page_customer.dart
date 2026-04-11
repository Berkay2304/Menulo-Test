import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:menulo/components/custom_navigation_bar.dart';
import 'package:menulo/notitiers/page_notifiers.dart';
import 'package:menulo/pages/Discover/discover_page.dart';
import 'package:menulo/pages/Favourites/favourites_page.dart';
import 'package:menulo/pages/MenuBot/menubot_page.dart';
import 'package:menulo/pages/Profile/profile_page.dart';
import 'package:menulo/pages/QR/qrscan_page.dart';
import 'package:menulo/pages/Room/rooms_main_page.dart';

final List<Map<String, dynamic>> pageData = [
  {'title': 'Discover', 'page': DiscoverPage()},
  {'title': 'Rooms', 'page': RoomsMainPage()},
  {'title': 'QR Scan', 'page': QRScanPage()},
  {'title': 'Favourites', 'page': FavouritesPage()},
  {'title': 'Profile', 'page': ProfilePage()},
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          body: pageData.elementAt(selectedPage)["page"],
          bottomNavigationBar: CustomNavigationBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("FAB clicked");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MenuBotPage();
                  },
                ),
              );
            },
            child: Center(child: FaIcon(FontAwesomeIcons.robot)),
          ),
        );
      },
    );
  }
}
