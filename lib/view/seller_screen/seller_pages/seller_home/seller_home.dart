import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/controller/provider/address_provider.dart';
import 'package:sukify/controller/provider/product_provider/product_provider.dart';
import 'package:sukify/model/address_model.dart';
import 'package:sukify/model/product_model.dart';
import 'package:sukify/model/user_model.dart';
import 'package:sukify/view/seller_screen/seller_pages/seller_home/seller_home_upload.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({super.key});

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SellerProductProvider>().fecthSellerProducts();
      context.read<AddressProvider>().getCurrentSelectedAddress();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SellerProfileDisplay(),
            const SizedBox(height: 25),
            SellerProductList(context),
          ],
        ),
      ),
      // floatingActionButton: ExtendedFAB(),
    );
  }

  Widget SellerProfileDisplay() {
    return Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
      if (addressProvider.fetchedCurrentSelectedAddress == true &&
          addressProvider.addressPresent) {
        AddressModel selectedAddress = addressProvider.currentSelectedAddress;
        return Row(children: [
          Text(
            'Hello, ${selectedAddress.name!}!',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
        ]);
      } else {
        return Text(
          "Hello",
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(0, 0, 0, 1)),
        );
      }
    }
        // child: Row(
        //   children: [
        //     CircleAvatar(
        //         radius: 27, backgroundImage: AssetImage('lib/assets/miles.jpg')),
        //     SizedBox(width: 8),
        //     Text(userModel.name.toString(),
        //         style: TextStyle(
        //             fontFamily: 'Inter',
        //             fontSize: 16,
        //             color: Color.fromRGBO(0, 0, 0, .5))),
        //   ],
        // ),
        );
  }

  Widget SellerProductList(BuildContext context) {
    return Consumer<SellerProductProvider>(
      builder: (context, sellerProductProvider, child) {
        if (sellerProductProvider.sellerProductsFetched == false) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (sellerProductProvider.products.isEmpty) {
          return Center(
            child: Text('No Products Found'),
          );
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            itemCount: sellerProductProvider.products.length,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
            itemBuilder: (context, index) {
              ProductModel currentModel = sellerProductProvider.products[index];
              return Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // ignore: unnecessary_string_interpolations
                    image: NetworkImage(currentModel.imagesURL![0]),
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
                            currentModel.name!,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          Text(
                            '₱${currentModel.price!}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
    // return SizedBox(
    //   height: MediaQuery.of(context).size.height,
    //   width: MediaQuery.of(context).size.width,
    //   child: GridView.builder(
    //     physics: const ScrollPhysics(),
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
    //     itemCount: orderHistoryPhoto.length,
    //     itemBuilder: (content, index) {
    //       Consumer<SellerProductProvider>(
    //         builder: (context, sellerProductProvider, child) {},
    //       );
    //     },
    //   ),
    // );
  }

  // Widget ExtendedFAB() {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 20),
  //     height: 65,
  //     clipBehavior: Clip.antiAlias,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(16),
  //       border: Border.all(color: const Color.fromRGBO(0, 0, 0, .1)),
  //     ),
  //     child: FloatingActionButton.extended(
  //       elevation: 1,
  //       clipBehavior: Clip.antiAlias,
  //       onPressed: () {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => SellerUpload()));
  //       },
  //       backgroundColor: Color.fromRGBO(69, 137, 216, 1),
  //       label: const Text(
  //         'Add',
  //         style: TextStyle(
  //           fontFamily: 'Inter',
  //           fontSize: 16,
  //           fontWeight: FontWeight.w600,
  //           color: Color.fromRGBO(255, 255, 255, 1),
  //         ),
  //       ),
  //       icon: Icon(Icons.add_sharp, color: Color.fromRGBO(255, 255, 255, 1)),
  //     ),
  //   );
  // }
}
