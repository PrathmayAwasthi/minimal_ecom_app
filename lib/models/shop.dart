import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/models/product.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(
      name: "Shoe",
      price: 7600.00,
      description:
          "Oh this is a very nice pair of shoes you should totally buy them you know blah blah blah.",
      imagePath: "assets/images/shoes.png",
    ),
    Product(
      name: "Hat",
      price: 230.00,
      description:
          "Oh this is a very nice hat you should totally buy it you know blah blah blah.",
      imagePath: "assets/images/hat.png",
    ),
    Product(
      name: "Glasses",
      price: 2130.50,
      description:
          "Oh this is a very nice pair of glasses you should totally buy them you know blah blah blah.",
      imagePath: "assets/images/glasses.png",
    ),
    Product(
      name: "Watch",
      price: 1809.50,
      description:
          "Oh this is a very watch you should totally buy it you know blah blah blah.",
      imagePath: "assets/images/watch.png",
    ),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
