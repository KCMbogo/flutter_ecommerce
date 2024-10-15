// components/shoe_tile.dart
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ecommerce/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  void Function()? onTap;
  Shoe shoe;

  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      width: 280,
      margin: EdgeInsets.only(left: 25),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // shoe pic
          ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(shoe.imagePath)),

          // description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(shoe.description, style: TextStyle(color: Colors.grey[600]),),
          ),

          // name, price, add to cart
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(shoe.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5),
                    Text('\$${shoe.price}', style: TextStyle(color: Colors.grey),)
                  ],
                ),
            
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black, 
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12))
                    ),
                    child: Icon(Icons.add, color: Colors.white, ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}