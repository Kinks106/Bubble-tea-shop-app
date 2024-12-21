import 'package:bubble_tea/components/bott_nav.dart';
import 'package:bubble_tea/pages/shop_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //navigate bottom bar
  int Selected_Index=0;
  void navigateBottombar(int newIndex)
  {
    setState(() {
      Selected_Index=newIndex;
    });
  }

  //pages to display
  final List<Widget> _pages=[
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index)=> navigateBottombar(index),
      ),
      body: _pages[Selected_Index],
      backgroundColor: Colors.brown[200],
    );
  }
}

