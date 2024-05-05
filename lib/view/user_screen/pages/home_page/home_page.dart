// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:sukify/controller/provider/address_provider.dart';
import 'package:sukify/controller/services/user_crud_services/user_crud_services.dart';
import 'package:sukify/view/address_screen/address_screen.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_best_selling.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_carousel.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_categories.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_new_arrival.dart';
import 'package:sukify/view/user_screen/pages/home_page/home_page%20widgets/home_search_bar.dart';

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
      context.read<AddressProvider>().getCurrentSelectedAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              StickyHeader(
                header: SearchBarConfig(),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Carousel(),
                    const SizedBox(height: 34),
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
                    const SizedBox(height: 26),
                    NewArrival(),
                    const SizedBox(height: 30),
                    BestSellingText(),
                    const SizedBox(height: 26),
                    BestSelling(),
                    const SizedBox(height: 20)
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
            'New Arrival',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'See All',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, .2),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  } //NewArrivalText

  Widget BestSellingText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Best Selling',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'See All',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, .2),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  } //BestSellingText
}
