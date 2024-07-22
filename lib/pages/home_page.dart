import "package:e_commerce_application/components/bottom_nav_bar.dart";
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 216, 216),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}