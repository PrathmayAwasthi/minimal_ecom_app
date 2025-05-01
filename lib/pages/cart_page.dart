import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/my_button.dart';
import 'package:minimal_ecom_app/components/my_drawer.dart';
import 'package:minimal_ecom_app/models/product.dart';
import 'package:minimal_ecom_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            content: Text("Remove this item from your cart?"),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<Shop>().removeFromCart(product);
                },
                child: Text("Yes, Remove"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: Text("C A R T"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child:
                cart.length > 0
                    ? ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              removeItemFromCart(context, item);
                            },
                          ),
                        );
                      },
                    )
                    : Center(child: Text("No items in cart. Add some?")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: MyButton(
              onTap: () {
                showDialog(context: context, builder: (context) => AlertDialog(
                  title: Text("User wants to PAY! LESGO!"),
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Text("PAY NOW"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
