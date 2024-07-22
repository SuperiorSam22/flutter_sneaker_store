import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

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
            mainAxisAlignment: MainAxisAlignment.center,
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
              GestureDetector(
                onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context ) => HomePage),),
                child: Container(
                  decoration: BoxDecoration(
                    color:Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25.0),
                  child: const Center(
                    child: Text('Shop Now!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}