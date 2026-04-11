import 'package:flutter/material.dart';
import 'package:menulo/components/custom_navigation_bar_owner.dart';
import 'package:menulo/notitiers/page_notifiers.dart';
import 'package:menulo/pages/MenuManager/menu_manager_page.dart';
import 'package:menulo/pages/MyBusiness/my_business_page.dart';

final List<Map<String, dynamic>> pageData = [
  {'title': 'Menu Manager', 'page': MenuManagerPage()},
  {'title': 'My Business', 'page': MyBusinessPage()},
];

class HomePageOwner extends StatefulWidget {
  const HomePageOwner({super.key});

  @override
  State<HomePageOwner> createState() => _HomePageOwnerState();
}

class _HomePageOwnerState extends State<HomePageOwner> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentOwnerPage,
      builder: (context, value, child) {
        return Scaffold(
          body: pageData.elementAt(value)["page"],
          bottomNavigationBar: CustomNavigationBarOwner(),
        );
      }
    );
  }
}
