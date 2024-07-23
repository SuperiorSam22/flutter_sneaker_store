import 'package:e_commerce_application/pages/intro_page.dart';
import 'package:e_commerce_application/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Cart(),
    builder: (context , child) => const MaterialApp(
      // home: IntroPage(),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    ),
    );
  }
}
