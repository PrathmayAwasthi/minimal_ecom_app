import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/my_drawer.dart';
import 'package:minimal_ecom_app/components/my_product_tile.dart';
import 'package:minimal_ecom_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: Text("S H O P"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => Navigator.pushReplacementNamed(context, '/cart_page'), icon: Icon(Icons.shopping_cart))
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Center(child: Text("Pick from a list of premium products.")),
          SizedBox(height: 10,),
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
            
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
