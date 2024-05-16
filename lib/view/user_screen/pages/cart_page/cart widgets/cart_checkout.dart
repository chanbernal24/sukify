import 'package:flutter/material.dart';
import 'package:sukify/controller/services/user_product_services/user_product_services.dart';
import 'package:sukify/model/user_product_model.dart';

class CartCheckout extends StatefulWidget {
  const CartCheckout({super.key});

  @override
  State<CartCheckout> createState() => _CartCheckoutState();
}

class _CartCheckoutState extends State<CartCheckout> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: UsersProductService.fetchCartProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'Opps! No Product Added To Cart',
            ),
          );
        }
        if (snapshot.hasData) {
          List<UserProductModel> cartProducts = snapshot.data!;
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(0, 0, 0, .2),
                  width: 1.0,
                ),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\₱ ${cartProducts.fold(
                          0.0,
                          (previousValue, product) =>
                              previousValue +
                              (double.parse(product.price!) *
                                  product.itemCount!),
                        )}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 24,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 47,
                    width: 122,
                    child: FilledButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(69, 137, 216, 1)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14))),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color.fromRGBO(240, 240, 240, 1)),
                        )),
                  ),
                )
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
