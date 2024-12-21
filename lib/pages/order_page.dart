import 'package:bubble_tea/models/drink.dart';
import 'package:bubble_tea/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink,});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //customize sweet slider
  double sweetValue=0.5;
  double iceValue=0.5;
  double pearlsValue=0.5;
void customizeSweet(double newValue)
{
  setState(() {
    sweetValue=newValue;
  });
}
//customize ice slider
void customizeIce(double newValue)
{
  setState(() {
    iceValue=newValue;
  });
}
//customize pearls slider
void customizePearls(double newValue)
{
  setState(() {
    pearlsValue=newValue;
  });
}

void addToCart()
{
  Provider.of<BubbleTeaShop>(context,listen:false).addToCart(widget.drink);
  //direct to shop page
  Navigator.pop(context);
  //let user know everything is successfully added
  showDialog(context: context, builder: (context)=>AlertDialog(
    title:Text('Item Added Successfully'),
  ),
  );

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget.drink.name)),
      backgroundColor: Colors.brown[200],
      body:Column(
        children: [
        //drink image
        Image.asset(widget.drink.imagePath),
        //sliders to customizedrink
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //sweetness
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                const SizedBox(
                  width:50,
                  child: Text('Sweet')),
                Expanded(
                  child: Slider(value: sweetValue, 
                  label:sweetValue.toString(),
                  divisions: 4,
                  onChanged: (value)=>customizeSweet(value),),
                )
              ],
              ),
              //ice slider
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                const SizedBox(
                  width:50,
                  child: Text('Ice')),
                Expanded(
                  child: Slider(value: iceValue, 
                  label:iceValue.toString(),
                  divisions: 4,
                  onChanged: (value)=>customizeIce(value),),
                )
              ],
              ),
              //pearls slider
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                const SizedBox(
                  width:50,
                  child: Text('Pearls')),
                Expanded(
                  child: Slider(value: pearlsValue, 
                  label:pearlsValue.toString(),
                  divisions: 4,
                  onChanged: (value)=>customizePearls(value),),
                )
              ],
              ),
            ],
            ),
        ),

        //add to cart button
        MaterialButton(
          color: Colors.brown,
          onPressed:addToCart ,
          child: Text('Add to Cart',
          style: TextStyle(color: Colors.black),
          ),
        )

        ]

      )
    );
  }
}