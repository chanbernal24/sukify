import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sukify/view/user_screen/pages/cart_page/cart%20widgets/cart_checkout.dart';
import 'package:sukify/view/user_screen/pages/cart_page/cart%20widgets/item_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .02),
              const Text(
                'Cart',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              ItemCart(),
            ],
          ),
        ),
        bottomNavigationBar: CartCheckout(),
      ),
    );
  }
}
