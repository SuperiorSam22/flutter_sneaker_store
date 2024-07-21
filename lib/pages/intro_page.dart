import "package:flutter/material.dart";

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              //loog
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('lib/images/pngwing.com (3).png',
                    height: 240,
                    
                    ),
                  ),
          
                  const SizedBox(height: 48,),
              //title
              const Text('Just do It',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
          
                const SizedBox(height: 48,),
              //sub title 
               const Text('Brand new sneakers made with premium quality!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                 ),
                textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48,),


              //start now button
              Container(
                decoration: BoxDecoration(
                  color:Colors.grey[900],
                ),
                child: Text('Shop Now!',
                style: TextStyle(color: Colors.white),
                
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}