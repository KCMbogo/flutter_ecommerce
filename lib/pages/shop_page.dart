// pages/shop_page.dart
// ignore_for_file: prefer_const_constructors// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/components/shoe_tile.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Succesful Added"),
        content: Text("Check your Cart"),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
      // search
      children: [
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8)
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Search", style: TextStyle(color: Colors.grey),),
              Icon(Icons.search, color: Colors.grey,),
          ],),
        ),

        // message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text("Everyone flies...Some fly longer than others", style: TextStyle(color: Colors.grey),),
        ),

        // hot picks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
            Text("Hot Picks 🔥", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            Text("See all", style: TextStyle(color: Colors.blue),)
          ],),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              // Shoe shoe = Shoe(name: 'Sneaker', price: "100", imagePath: 'lib/images/sneaker.jpg', description: 'Foot quality');
              Shoe shoe = value.getShoeList()[index];
              return ShoeTile(shoe: shoe, onTap: () => addShoeToCart(shoe));
            },
          )
        ),

        Padding(
          padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
          child: Divider(
            color: Colors.white,
          ),
        )
      ],
    )
    );
  }
}