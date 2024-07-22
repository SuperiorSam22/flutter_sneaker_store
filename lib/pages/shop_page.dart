import 'package:e_commerce_application/models/shoe.dart';
import 'package:flutter/material.dart';

import '../components/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //search bar
       children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search'),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
          ],
          
          ),
        ),
        //message 
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          child: Text('Everyone flies... Some fly longer than others!'),
        ),


        //hot picks 
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Hot Picks!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              ),
              Text('see all',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ),

        const SizedBox(height: 10,),

        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Shoe shoe = Shoe(
                name: 'Air Jordan',
                price: '240',
                imagePath: 'lib/images/pngwing.com (4).png',
                description: 'cool shoe',
              );
              return ShoeTile(
                shoe: shoe,
              );
            },),),

            const Padding(
              padding: EdgeInsets.only(
                top: 25.0,
                left: 25.0,
                right: 25.0, 
              ),
              child: Divider(
                color: Colors.white,
              ),
            )
       ],

    );
  }
}