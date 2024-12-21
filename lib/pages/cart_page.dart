import 'package:bubble_tea/components/drink_tile.dart';
import 'package:bubble_tea/models/drink.dart';
import 'package:bubble_tea/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
//remove from cart

void removeFromCart(Drink drink)
{
  Provider.of<BubbleTeaShop>(context,listen: false).removeFromCart(drink);
}

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(builder:(context,value,child)=>
    SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            //heading
            const Text('Your Cart',style: TextStyle(
              fontSize: 25,
            ),
            ),

            //list of items added to cart
            Expanded(child: ListView.builder(
              itemCount: value.cart.length,
              itemBuilder: (context,index)
            {
              //get individual drink in cart first
              Drink drink=value.cart[index];
              //return as a nice tile
              return DrinkTile(drink: drink, onTap: ()=>removeFromCart(drink), trailing:Icon(Icons.delete));
            }
            ),
            ),
            
        
            //pay button
            MaterialButton(
              onPressed: () {},
              color:Colors.brown,
              child: Text('Pay', 
              style: TextStyle(color: Colors.black),
              ),
            )
        
          ],
        ),
      ),
    )
    );
  }
}
