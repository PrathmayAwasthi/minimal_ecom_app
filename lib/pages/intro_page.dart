import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_ecom_app/components/my_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Icon(Icons.shopping_cart, size: 100),

            SizedBox(height: 25),

            // Heading Text
            Text(
              "Minimal Shop",
              style: GoogleFonts.poppins(fontSize: 25),
            ),

            SizedBox(height: 10),

            // Sub-heading Text
            Text("Shop Premium Products."),

            SizedBox(height: 40),

            MyButton(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/shop_page');
              },
              child: Icon(Icons.arrow_right_alt_rounded, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
