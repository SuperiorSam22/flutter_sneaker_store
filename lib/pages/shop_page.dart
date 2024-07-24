import 'package:e_commerce_application/components/custom_alert.dart';
import 'package:e_commerce_application/models/cart.dart';
import 'package:e_commerce_application/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  final _searchController = TextEditingController(); 

  //add shoe to cart method 
  //when the user click the + button shoe should be aded to the cart 
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    //alert that the shoe was added into the cart 
    customAlert(context, 
    'Added', 
    'Item was successfully added in your cart'
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => 
    
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //search bar
       children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
            ),
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
              //get a shoe from shop list
              Shoe shoe = value. getShoeList()[index];
              return ShoeTile(
                onTap: () => addShoeToCart(shoe),
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

    ),
    );
  }
}