import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/models/product.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(name: "Shoe", price: 230.0, description: "Oh this is a very nice pair of shoes you should totally buy them you know blah blah blah."),
    Product(name: "Hat", price: 2300.0, description: "Oh this is a very nice hat you should totally buy it you know blah blah blah."),
    Product(
      name: "Glasses",
      price: 2130.0,
      description: "Oh this is a very nice pair of glasses you should totally buy them you know blah blah blah.",
    ),
    Product(name: "Watch", price: 230.05, description: "Oh this is a very watch you should totally buy it you know blah blah blah."),
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
