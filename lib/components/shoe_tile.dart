import 'package:flutter/material.dart';

import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Container(
        margin:const  EdgeInsets.only(left: 25),
        width: 300,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //shoe picture 
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(shoe.imagePath),
            ),
            //description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                shoe.description, 
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            //price + details
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //shoe name 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(shoe.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
              
                    const SizedBox(height: 5,), 
              
                    Text(
                      '₹ ${shoe.price}', 
                    style:const TextStyle(
                      color: Colors.grey,
                    ),),
                  ],
                ),
                  //plus button
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                     borderRadius:  BorderRadius.only(bottomRight: Radius.circular(12)),
                    color: Colors.black),
                    child: const Icon(Icons.add,
                    color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
            //button add to cart 
          ],
        ),
      ),
    );
  }
}