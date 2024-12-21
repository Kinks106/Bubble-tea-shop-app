import 'package:bubble_tea/models/drink.dart';
import 'package:flutter/cupertino.dart';

class BubbleTeaShop extends ChangeNotifier{
  //list of drinks for sale
  final List<Drink> _shop=[
    //chai tea
    Drink(name: "Chai tea", price:"\$69", imagePath: "lib/images/milk.png"),
  ];

  //list of drinks in user cart
  final List<Drink> _userCart=[

  ];

  //get drinks for sale
  List<Drink> get shop=> _shop;

  //get user cart
  List<Drink> get cart=>  _userCart;

  //add drink to cart
  void addToCart(Drink drink)
  {
    _userCart.add(drink);
    notifyListeners();
  }

  //remove drink from cart
void  removeFromCart(Drink drink)
  {
    _userCart.remove(drink);
    notifyListeners();
  }
}