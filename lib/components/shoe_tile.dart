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
            Text(
              shoe.description, 
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            //price + details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //shoe name 
                Column(children: [
                  Text(shoe.name),
                  Text(shoe.price),
                ],
              ),
                //plus button
              const Icon(Icons.add),
              ],
            )
            //button add to cart 
          ],
        ),
      ),
    );
  }
}