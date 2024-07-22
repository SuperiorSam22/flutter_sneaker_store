import "package:e_commerce_application/components/bottom_nav_bar.dart";
import "package:flutter/material.dart";

import "cart_page.dart";
import "shop_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //this selected index is to control the bottom nav bar 
  int _selectedIndex = 0;


  //this will update our selected index 
  //when we tap on the bottom bar 
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to navigate 
  final List<Widget> _pages = [
    //shop page 
    const ShopPage(),
    //cart page
    const CartPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 216, 216),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex]  ,
    );
  }
}