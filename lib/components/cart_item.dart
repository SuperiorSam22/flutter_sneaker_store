import 'package:e_commerce_application/models/cart.dart';
import 'package:e_commerce_application/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {


  //remove item from cart 
  void deleteItemFromCart() {
    Provider.of<Cart>(context, listen: false).deleteItemFromCart(widget.shoe);  
  }

  //increment items in the cart 
  void incrementQuantity() {
    Provider.of<Cart>(context, listen: false).addItemToCart(widget.shoe);
  }

  //decrement items in the cart 
  void decrementQuantity() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              // Leading image
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(widget.shoe.imagePath),
              ),
              // Main content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.shoe.name),
                      Text(widget.shoe.price),
                    ],
                  ),
                ),
              ),
              // Action buttons and count
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: decrementQuantity,
                  ),
                  SizedBox(width: 16), // Space between buttons
                  Text(widget.shoe.quantity.toString()), // Display quantity
                  SizedBox(width: 16), // Space between buttons
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: incrementQuantity,
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: deleteItemFromCart,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
