import 'package:bubble_tea/models/drink.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class DrinkTile extends StatelessWidget {
  final Drink drink;
  final Widget trailing;
  void Function()?onTap;
  DrinkTile({super.key,
  required this.drink,
  required this.onTap,
  required this.trailing,
  }
);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
		onTap: onTap,
	  child: Container(
      margin:EdgeInsets.only(bottom: 10),
			decoration: BoxDecoration(color:Colors.brown[100],
			borderRadius: BorderRadius.circular(30),
			),
		  child: ListTile(
		  title:Text(drink.name),
			subtitle: Text(drink.price),
			leading:Image.asset(drink.imagePath),
			trailing: trailing,
		  ),
		),
	);
  }
}