import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/widgets/drower.dart';
import 'card_page/card_page.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {


  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      Container(
        color: Colors.deepOrange,

      ),
      const DrawerBaner(),
      const CardsPage(),
    ];
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          currentPage = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sms), label: "SmS"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_card), label: "Add cart"),
        ],
      ),
    );
  }
}
