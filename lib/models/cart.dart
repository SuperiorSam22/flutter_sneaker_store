import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier{
  //list of shoes for sale 
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom Freak', 
      price: '22,000',
      imagePath: 'lib/images/pngwing.com (4).png',
      description: 'The forward thinking design of this latest signature shoe!',
      quantity: 1,
    ),

    Shoe(
      name: 'Air Jordans', 
      price: '80,000',
      imagePath: 'lib/images/pngwing.com (5).png',
      description: 'The forward thinking design of this latest signature shoe!',
      quantity: 1,
    ),

    Shoe(
      name: 'Travis Scott AJ', 
      price: '2,25,000',
      imagePath: 'lib/images/pngwing.com (6).png',
      description: 'The forward thinking design of this latest signature shoe!',
      quantity: 1,
    ),

    Shoe(
      name: 'KD Treys', 
      price: '29,000',
      imagePath: 'lib/images/pngwing.com (7).png',
      description: 'The forward thinking design of this latest signature shoe!',
      quantity: 1,
    ),
  ];

  //list of items in user cart 
  List<Shoe> userCart = [];

  //get list of shoes for sale  
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart 
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add item to cart 
  void addItemToCart(Shoe shoe) {
   int index = userCart.indexWhere((item) => item.name == shoe.name);
   if(index >= 0){
    userCart[index].quantity += 1;
   } else {
    userCart.add(shoe);
   }
   notifyListeners();
  }

  //remove items from the cart 
  void removeItemFromCart(Shoe shoe) {
    int index = userCart.indexWhere((item) => item.name == shoe.name);
    if(index >= 0 && userCart[index].quantity > 1) {
      userCart[index].quantity -= 1;
    } else {
      userCart.removeWhere((item) => item.name == shoe.name);
    }
    notifyListeners();
  }

  //delete items from the cart 
  void deleteItemFromCart(Shoe shoe) {
    int index = userCart.indexWhere((item) => item.name == shoe.name);
    userCart[index].quantity = 1;
    userCart.remove(shoe);
    notifyListeners();
  }

}