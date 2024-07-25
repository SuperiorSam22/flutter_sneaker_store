import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/shoe.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>( builder: (context, value, child) => 
     
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //search bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            decoration: BoxDecoration(
          
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.toLowerCase();
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),

          const Text('Available items to search',
          style: TextStyle(
            color: Colors.grey,
          ),),
          //to display searched items
          Expanded(
            child: Consumer<Cart>(
              builder: (context, cart, child) {
                List<Shoe> searchResults = cart.getShoeList().where((shoe) {
                  return shoe.name.toLowerCase().contains(_searchQuery);
                }).toList();

                return ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    Shoe shoe = searchResults[index];
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(shoe.name),
                            ),
                            subtitle: Text(shoe.price),
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(shoe.imagePath, 
                              fit: BoxFit.cover,),
                            ),
                            onTap: () {
                              //lead to the details page

                            },
                            trailing: IconButton( 
                            onPressed: () {
                              cart.addItemToCart(shoe);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${shoe.name} added to cart'),
                                  
                                ),
                              );
                            }, icon: const Icon(Icons.shopping_bag),),
                          
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}