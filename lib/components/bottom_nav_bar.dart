import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Color.fromARGB(255, 177, 177, 177),
        activeColor: Color.fromARGB(255, 73, 73, 73),
        tabActiveBorder: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        tabs: [
          GButton(icon: Icons.home,
          text: 'shop',
          ),
          GButton(icon: Icons.shopping_bag_rounded,
          text: 'cart',
          ),

      ],),
    );
  }
}