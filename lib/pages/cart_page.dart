import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/my_drawer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: Text("C A R T"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
    );
  }
}