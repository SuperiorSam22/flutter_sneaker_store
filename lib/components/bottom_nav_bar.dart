import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: const Color.fromARGB(255, 177, 177, 177),
        activeColor:const Color.fromARGB(255, 73, 73, 73),
        tabActiveBorder: Border.all( color: const Color.fromARGB(255, 255, 255, 255)),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: (value) => onTabChange!(value) ,
        tabBorderRadius: 16,
        tabs: const [
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