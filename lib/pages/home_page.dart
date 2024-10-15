// pages/home_page.dart
// ignore_for_file: prefer_const_constructors, unused_field

import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void navigateBottomBar(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    // shop page
    ShopPage(),

    // cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(onTabChange: (index) => navigateBottomBar(index),),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) {
            return IconButton(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(Icons.menu, color: Colors.black,),
                ),
                onPressed: () { Scaffold.of(context).openDrawer(); },
              );
          }
        )
        ),

      body: _pages[_selectedIndex],

      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          // logo
          Column(
            children: [
              DrawerHeader(child: Image.asset("lib/images/nike.png", color: Colors.white,)),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(color: Colors.grey[800],),
              ),
              
              // other pages
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.white,),
                  title: Text("Shop", style: TextStyle(color: Colors.white),),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.white,),
                  title: Text("About", style: TextStyle(color: Colors.white),),
                ),
              ),
              
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.white,),
              title: Text("Logout", style: TextStyle(color: Colors.white),),
            ),
          ),

        ],),
      ),
    );
  }
}