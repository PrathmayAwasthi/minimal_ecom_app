import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(child: Icon(Icons.shopping_bag, size: 70)),

              SizedBox(height: 20),
              MyListTile(
                text: "S H O P",
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamedAndRemoveUntil(context, '/shop_page', (route) => false);
                },
              ),

              SizedBox(height: 7),
              MyListTile(
                text: "C A R T",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamedAndRemoveUntil(context, '/cart_page', (route) => false);
                },
              ),
              SizedBox(height: 20),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: MyListTile(
              text: "E X I T",
              icon: Icons.logout,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/intro_page',
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
