// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/controller/provider/address_provider.dart';
import 'package:sukify/controller/provider/product_provider/product_provider.dart';
import 'package:sukify/controller/provider/users_product_provider/users_product_provider.dart';
import 'package:sukify/controller/services/user_crud_services/user_crud_services.dart';
import 'package:sukify/model/product_model.dart';
import 'package:sukify/view/address_screen/address_screen.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_best_selling.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_carousel.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_categories.dart';

import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_search_bar.dart';
import 'package:sukify/view/user_screen/pages/product_screen/product_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  checkUsersAddress() async {
    bool userAddressPresent = await UserDataCRUD.checkUsersAddress();
    if (userAddressPresent == false) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .04,
                horizontal: MediaQuery.of(context).size.width * .03),
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add address"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                  child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              PageTransition(
                                  child: AddressScreen(),
                                  type: PageTransitionType.rightToLeft),
                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * .4,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .03,
                              vertical:
                                  MediaQuery.of(context).size.height * .01),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Builder(
                            builder: (context) {
                              if (index == 0) {
                                return Text("Add Address");
                              } else {
                                return Text("Add Address");
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkUsersAddress();
      context.read<SellerProductProvider>().fecthSellerProductsToUser();

      context.read<AddressProvider>().getCurrentSelectedAddress();
      context.read<UsersProductProvider>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              StickyHeader(
                header: SearchBarConfig(),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Categories(),
                    const SizedBox(height: 22),
                    NewArrivalText(),
                    const SizedBox(height: 20),
                    productsList(context),
                    const SizedBox(height: 20),
                  ], //children
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget NewArrivalText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Clothes',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
        ],
      ),
    );
  } //NewArrivalText

  Widget productsList(BuildContext context) {
    final sellersProductProvider = Provider.of<SellerProductProvider>(context);
    return Consumer<SellerProductProvider>(
        builder: (context, sellerProductProvider, child) {
      if (sellerProductProvider.userProductsFetched == false) {
        return Text("Error fetching products");
      } else {
        if (sellerProductProvider.userProductsFetched) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              scrollDirection: Axis.vertical,
              itemCount: sellersProductProvider.userProducts.length,
              itemBuilder: (content, index) {
                ProductModel currentProduct =
                    sellersProductProvider.userProducts[index];
                log(currentProduct.toString());
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreenDisplay(
                              productModel: currentProduct),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * .30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(currentProduct.imagesURL![0]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromRGBO(0, 0, 0, .1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                overflow: TextOverflow.ellipsis,
                                currentProduct.name!,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  color: Color.fromRGBO(240, 240, 240, 1),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    '\₱${currentProduct.price!}',
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                      color: Color.fromRGBO(240, 240, 240, 1),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.star_border_outlined,
                                    color: Color.fromRGBO(240, 240, 240, 1),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 2),
                                  // Text(
                                  //   bestSellingRatings[index],
                                  //   style: const TextStyle(
                                  //     fontFamily: 'Inter',
                                  //     fontSize: 12,
                                  //     color: Color.fromRGBO(255, 255, 255, 1),
                                  //   ),
                                  // ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      }
    });
  }
}
