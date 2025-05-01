import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/models/product.dart';
import 'package:minimal_ecom_app/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  // Add to cart pressed
  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text("Add this item to your cart?"),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<Shop>().addToCart(product);
                },
                child: Text("Yes, Add"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.infinity,
                    child: Icon(Icons.favorite),
                  ),
                ),

                SizedBox(height: 20),

                // Product name
                Text(
                  product.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                // Product description
                Text(product.description),
              ],
            ),

            // product price + button to add to cart (converting to string with 2 decimal places)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₹" + product.price.toStringAsFixed(2),
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
