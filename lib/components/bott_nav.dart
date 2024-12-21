import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key,required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:25.0),
      child: GNav(
        onTabChange: (value)=> onTabChange!(value),
          mainAxisAlignment:MainAxisAlignment.center,
          activeColor: Colors.black54,
          color: Colors.black,
          tabActiveBorder: Border.all(color:Colors.white54),
          gap:8,
          tabs: [
        //shop tab
        GButton(icon: Icons.home,
        text:'Shop'),

        //cart tab
        GButton(icon: Icons.shopping_bag,
        text:'Cart'),
      ]),
    );
  }
}
