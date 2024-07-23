import 'package:e_commerce_application/pages/home_page.dart';
import 'package:e_commerce_application/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPageRedirect extends StatelessWidget {
  const MainPageRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ) ,
    );
  }
}