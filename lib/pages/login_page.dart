import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 216, 216, 216),
      body: 
      SafeArea(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset('lib/images/niketick.png',
                  height: 100,
                  color: Colors.grey[500],
                  ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              //Hello again user! 
              const Text('Hello Again!',
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
               ),
              ),
              const SizedBox(height: 10,),
               const Text("Welcome back you've been missed!",
               style: TextStyle(
                fontSize: 20,
               ),
              ),
              const SizedBox(height: 25,),

              // email text field 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              //password textfield 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(  
                        border: InputBorder.none,
                        hintText: 'Passoword',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              //signin button 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text('Sign In', 
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      ),
                      ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
          
              //register button ? not a member register now
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member? ',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Register Now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                  )
                ],
              ),
            const SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
