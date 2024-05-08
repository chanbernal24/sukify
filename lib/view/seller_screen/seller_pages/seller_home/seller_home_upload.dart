import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/controller/provider/product_provider/product_provider.dart';
import 'package:sukify/view/seller_screen/seller_nav.dart';

class SellerUpload extends StatefulWidget {
  const SellerUpload({super.key});

  @override
  State<SellerUpload> createState() => _SellerUploadState();
}

class _SellerUploadState extends State<SellerUpload> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController manufacturerNameController = TextEditingController();
  TextEditingController countryOfOriginController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController iscountedPriceController = TextEditingController();
  TextEditingController productIDController = TextEditingController();
  TextEditingController productSellerIDController = TextEditingController();
  TextEditingController discountPercentageController = TextEditingController();

  String dropdownvalue = 'Dress';

  final chosenCategory = [
    'Dress',
    'Jeans',
    'T-shirts',
    'Shoes',
    'Suits',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<SellerProductProvider>(
              builder: (context, sellerProductProvider, child) {
                return Builder(builder: (context) {
                  if (sellerProductProvider.productImages.isEmpty) {
                    return uploadProductImage(context);
                  } else {
                    List<File> images =
                        context.read<SellerProductProvider>().productImages;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .5,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (content, index) {
                          return Builder(
                            builder: (context) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width * .52,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(images[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                margin: const EdgeInsets.only(right: 8),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                });
              },
            ),
            const SizedBox(height: 18),
            ProductNameField(),
            ChooseProductCategory(context),
            ProductDescription(),
            ProductBrand(),
            ProductCountryofOrigin(),
            ProductPrice(),
            const SizedBox(height: 13),
            AddProductButton(),
            const SizedBox(height: 13),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingBackButton(context),
    );
  }

  Widget FloatingBackButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 41),
      child: FloatingActionButton.small(
        elevation: 0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SellerNavBar()));
        },
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
      ),
    );
  }

  Widget AddProductButton() {
    return Container(
      height: 63,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(69, 137, 216, 1)),
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: () {},
          child: const Text(
            'Add Product',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromRGBO(255, 255, 255, 1)),
          )),
    );
  }

  Widget DiscountedPrice() {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Discounted Price',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color.fromRGBO(53, 53, 53, 1))),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(69, 137, 216, 1),
                ),
              ),
              hintText: "0000",
              hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 0, 0, .2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget ProductPrice() {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Price',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color.fromRGBO(53, 53, 53, 1))),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(69, 137, 216, 1),
                ),
              ),
              hintText: "0000",
              hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 0, 0, .2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget ProductCountryofOrigin() {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Country of Origin',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color.fromRGBO(53, 53, 53, 1))),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(69, 137, 216, 1),
                ),
              ),
              hintText: "Eg. Philippines",
              hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 0, 0, .2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget ProductBrand() {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Brand',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color.fromRGBO(53, 53, 53, 1))),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(69, 137, 216, 1),
                ),
              ),
              hintText: "Eg. Nike",
              hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 0, 0, .2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget ProductDescription() {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color.fromRGBO(53, 53, 53, 1))),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(69, 137, 216, 1),
                ),
              ),
              hintText: "Enter Description",
              hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 0, 0, .2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget ChooseProductCategory(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Product Category',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color.fromRGBO(53, 53, 53, 1))),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(8),
            height: 63,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(0, 0, 0, .2)),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                value: dropdownvalue,
                style: const TextStyle(
                    fontFamily: 'Inter', color: Color.fromRGBO(53, 53, 53, 1)),
                icon: const Icon(Icons.arrow_drop_down),
                items: chosenCategory.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget ProductNameField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //PRODUCT NAME
          Text('Product Name',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color.fromRGBO(53, 53, 53, 1))),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(69, 137, 216, 1),
                ),
              ),
              hintText: "Enter Product Name",
              hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, .2)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 0, 0, .2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget uploadProductImage(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<SellerProductProvider>()
            .fetchProductImagesFromGallery(context: context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 358,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(0, 0, 0, .1))),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 40, color: Color.fromRGBO(0, 0, 0, .5)),
            SizedBox(height: 5),
            Text('Upload Photo',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, .5))),
          ],
        ),
      ),
    );
  }
}
