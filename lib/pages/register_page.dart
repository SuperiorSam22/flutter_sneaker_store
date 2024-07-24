import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  
  // text controllers 
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    try {
      if(isPasswordConfirmed()){
      await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text,
      );
      }  
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              content:  SingleChildScrollView(
              child: ListBody(
              children: <Widget>[
              Text(e.message.toString()),
              const Text('Please enter the email in correct format\nexample@gmail.com'),
            ],
          ),
        ),    
        );
      }); 
    }   
  }

  bool isPasswordConfirmed() {
    if(_passwordController.text.trim() == _confirmPasswordController.text.trim()){
      return true;
    } else {
      return false; 
    }
  }

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
              const Text('Hello There!',
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
               ),
              ),
              const SizedBox(height: 10,),
               const Text("Register below with your details!",
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

              //password textfield 
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
                      controller: _passwordController ,
                      obscureText: true,
                      decoration: const InputDecoration(  
                        border: InputBorder.none,
                        hintText: 'Passoword',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              //confirm password textfield 
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
                      controller: _confirmPasswordController ,
                      obscureText: true,
                      decoration: const InputDecoration(  
                        border: InputBorder.none,
                        hintText: 'Confirm passoword',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              //signin button 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text('Register', 
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        ),
                        ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
          
              //register button ? not a member register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ const Text('Alreay a member? ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text('Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                    ),
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