// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/controller/services/product_services/product_services.dart';
import 'package:sukify/controller/services/user_product_services/user_product_services.dart';
import 'package:sukify/model/user_product_model.dart';
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
              ProductShow()
            ],
          ),
        ),
        bottomNavigationBar: CartCheckout(),
      ),
    );
  }
}

class ProductShow extends StatelessWidget {
  const ProductShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: UsersProductService.fetchCartProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserProductModel> cartProducts = snapshot.data!;
            return Column(
              children: [
                ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: cartProducts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    UserProductModel currentProduct = cartProducts[index];
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.16,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                      child: Row(
                        children: [
                          // RoundCheckBox(
                          //   checkedWidget: Container(
                          //     color: const Color.fromRGBO(
                          //         156, 192, 245, 1),
                          //   ),
                          //   size: 23,
                          //   borderColor: const Color.fromRGBO(
                          //       156, 192, 245, 1),
                          //   onTap: (selected) {},
                          // ),
                          // const SizedBox(width: 5),
                          Expanded(
                            flex: 10,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(0, 0, 0, .05)),
                                  borderRadius: BorderRadius.circular(14)),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          12,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              12,
                                      margin: const EdgeInsets.all(8),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Image(
                                        image: NetworkImage(
                                            currentProduct.imagesURL![0]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      currentProduct.name!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                          fontFamily: 'Inter',
                                                          fontSize: 12,
                                                          color: Color.fromRGBO(
                                                              53, 53, 53, 1)),
                                                    ),
                                                    Text(
                                                      currentProduct.brandName!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontFamily: 'Inter',
                                                          fontSize: 10,
                                                          color: Color.fromRGBO(
                                                              53, 53, 53, 1)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        240, 240, 240, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: IconButton(
                                                    icon: Image.asset(
                                                        'lib/assets/delete.png'),
                                                    onPressed: () async {
                                                      await UsersProductService
                                                          .removeProductfromCart(
                                                        productId:
                                                            currentProduct
                                                                .productID!,
                                                        context: context,
                                                      );
                                                    },
                                                  ))
                                            ],
                                          ),
                                          //CODE BELOW IS FOR SIZE
                                          // Row(
                                          //   children: [
                                          //     Container(
                                          //         width: 31,
                                          //         height: 20,
                                          //         decoration:
                                          //             BoxDecoration(
                                          //           color: const Color
                                          //               .fromRGBO(240,
                                          //               240, 240, 1),
                                          //           borderRadius:
                                          //               BorderRadius
                                          //                   .circular(
                                          //                       5),
                                          //         ),
                                          //         child: const Center(
                                          //           child: Text(
                                          //             'Size:',
                                          //             style: TextStyle(
                                          //                 fontFamily:
                                          //                     'Inter',
                                          //                 fontWeight:
                                          //                     FontWeight
                                          //                         .w300,
                                          //                 fontSize:
                                          //                     10,
                                          //                 color: Color
                                          //                     .fromRGBO(
                                          //                         0,
                                          //                         0,
                                          //                         0,
                                          //                         1)),
                                          //           ),
                                          //         )),
                                          //     const SizedBox(
                                          //         width: 4),
                                          //     Text(
                                          //       cartProductSize[
                                          //           index],
                                          //       style:
                                          //           const TextStyle(
                                          //               fontFamily:
                                          //                   'Inter',
                                          //               fontSize: 12,
                                          //               color: Color
                                          //                   .fromRGBO(
                                          //                       0,
                                          //                       0,
                                          //                       0,
                                          //                       1)),
                                          //     ),
                                          //     const SizedBox(
                                          //         width: 23),
                                          //   ],
                                          // ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        240, 240, 240, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: IconButton(
                                                    icon: Image.asset(
                                                        'lib/assets/add.png'),
                                                    onPressed: () async {
                                                      await UsersProductService
                                                          .updateCountCartProduct(
                                                        productId:
                                                            currentProduct
                                                                .productID!,
                                                        newCount: currentProduct
                                                                .itemCount! +
                                                            1,
                                                        context: context,
                                                      );
                                                    },
                                                  )),
                                              SizedBox(width: 8),
                                              Text(
                                                currentProduct.itemCount!
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1)),
                                              ),
                                              SizedBox(width: 8),
                                              Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        240, 240, 240, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: IconButton(
                                                    icon: Image.asset(
                                                        'lib/assets/minus.png'),
                                                    onPressed: () async {
                                                      if (currentProduct
                                                              .itemCount ==
                                                          1) {
                                                        await UsersProductService
                                                            .removeProductfromCart(
                                                          productId:
                                                              currentProduct
                                                                  .productID!,
                                                          context: context,
                                                        );
                                                      }
                                                      await UsersProductService
                                                          .updateCountCartProduct(
                                                        productId:
                                                            currentProduct
                                                                .productID!,
                                                        newCount: currentProduct
                                                                .itemCount! -
                                                            1,
                                                        context: context,
                                                      );
                                                    },
                                                  )),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .19),
                                              Flexible(
                                                child: Text(
                                                  '\₱${currentProduct.price!}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 10,
                                                      color: Color.fromRGBO(
                                                          53, 53, 53, 1)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                // ItemCart(),
              ],
            );
          }
          if (snapshot.hasError) {
            return const Text('Error Found');
          } else {
            return const Text('Cart is Empty');
          }
        });
  }
}
