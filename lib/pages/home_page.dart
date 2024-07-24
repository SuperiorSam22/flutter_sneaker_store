import "package:e_commerce_application/components/bottom_nav_bar.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "cart_page.dart";
import "shop_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;

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
      backgroundColor: const Color.fromARGB(255, 216, 216, 216),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Padding(
                padding:  EdgeInsets.only(left: 12.0),
                child:  Icon(
                  Icons.menu,
                  color: Colors.black,
                  ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //logo
            
            Column(
              children: [
                DrawerHeader(child: Image.asset('lib/images/niketick.png',
            color: Colors.white,),),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(color: Colors.grey[800],
              ),
            ),
            //other pages
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text('home', style: TextStyle(color: Colors.white),),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.white,),
                title: Text('about', style: TextStyle(color: Colors.white),),
              ),
            ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25),
              child:
               GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                 child: const ListTile(
                  leading: Icon(Icons.logout, color: Colors.white,),
                  title: Text('logout', style: TextStyle(color: Colors.white),),
                               ),
               ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}