import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotpasswordPage extends StatefulWidget {
  
  const ForgotpasswordPage({super.key});

  @override
  State<ForgotpasswordPage> createState() => _ForgotpasswordPageState();
}

class _ForgotpasswordPageState extends State<ForgotpasswordPage> {

  final _emailController = TextEditingController();

  @override 
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    Future passwordReset() async {
    try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
        if(mounted){
        showDialog(context: context, 
        builder: (context) {
          return AlertDialog(
            content: Text('Pass reset link sent'),
          );
        });
        }
    } on FirebaseAuthException catch(e) {
        print(e);
        if(mounted){
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
        }
      }
    }

      
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 216, 216, 216),
      appBar: AppBar(
        title: const Text('Sneaker Store',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey[900],
        elevation: 0,),
      body: Column(
        children: [
          const SizedBox(height: 25,),
          const Text("Enter your email and we'll send you a password reset link!"),

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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              MaterialButton(
                onPressed: passwordReset,
              color: Colors.grey[700],
              child: const Text('Reset password',),),
        ],
      )
    );
  }
}