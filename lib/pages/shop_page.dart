import 'package:bubble_tea/components/drink_tile.dart';
import 'package:bubble_tea/models/drink.dart';
import 'package:bubble_tea/models/shop.dart';
import 'package:bubble_tea/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

	//user sekected drink go to order page ,method
	void goToOrderPage(Drink drink)
	{
		Navigator.push(context,MaterialPageRoute(builder: (context)=>OrderPage(
			drink: drink,
		),));
	}

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop> (builder: (context,value,child)=>SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(children: [
          //heading
          Text("Bubble Tea Shop",style: TextStyle(fontSize: 25),),
          const SizedBox(height: 10,),

          //list of drinks for sale
          Expanded(
            child: ListView.builder(
              itemCount: value.shop.length, 
              itemBuilder: (context,index){
			  //get individual drink from shop
			  Drink individualDrink=value.shop[index];

			  //return a nice list tile
			  return DrinkTile(
				drink: individualDrink,
				onTap: ()=>goToOrderPage(individualDrink),
        trailing:Icon(Icons.forward),
				);
			  },
              ),
              ),
        ],),
      ),
    ),
    );
  }
}
