import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/controller/services/user_product_services/user_product_services.dart';
import 'package:sukify/model/product_model.dart';
import 'package:sukify/model/user_product_model.dart';
import 'package:sukify/view/user_screen/navbar_main.dart';

enum Sizes { small, medium, large, extraLarge }

class ProductScreenDisplay extends StatefulWidget {
  ProductScreenDisplay({super.key, required this.productModel});
  ProductModel productModel;

  @override
  State<ProductScreenDisplay> createState() => _ProductScreenDisplayState();
}

class _ProductScreenDisplayState extends State<ProductScreenDisplay> {
  Sizes sizesView = Sizes.small;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductScreenPhoto(context),
                const SizedBox(height: 10),
                ProductScreenName(),
                ProductScreenInfos(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: FloatingBackButton(context),
        bottomNavigationBar: AddtoCartButton(context),
      ),
    );
  }

  Widget FloatingBackButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 41),
      child: FloatingActionButton.small(
        elevation: 0,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavbarPageMainPage()));
        },
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
      ),
    );
  }

  Widget ProductScreenInfos() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Brand: ${widget.productModel.brandName}',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color.fromRGBO(0, 0, 0, .5)),
              ),
              // Row(
              //   children: [
              //     const Text(
              //       'Qty:',
              //       style: TextStyle(
              //           fontFamily: 'Inter',
              //           fontSize: 12,
              //           color: Color.fromRGBO(0, 0, 0, 1)),
              //     ),
              //     const SizedBox(
              //       width: 12,
              //     ),
              //     Container(
              //         width: 30,
              //         height: 30,
              //         decoration: BoxDecoration(
              //           color: const Color.fromRGBO(240, 240, 240, 1),
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: IconButton(
              //           icon: Image.asset('lib/assets/add.png'),
              //           onPressed: () {},
              //         )),
              //     const SizedBox(width: 8),
              //     const Text(
              //       '0',
              //       style: TextStyle(
              //           fontFamily: 'Inter',
              //           fontSize: 12,
              //           color: Color.fromRGBO(0, 0, 0, 1)),
              //     ),
              //     SizedBox(width: 8),
              //     Container(
              //         width: 30,
              //         height: 30,
              //         decoration: BoxDecoration(
              //           color: const Color.fromRGBO(240, 240, 240, 1),
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: IconButton(
              //           icon: Image.asset('lib/assets/minus.png'),
              //           onPressed: () {},
              //         )),
              //   ],
              // ),
            ],
          ),
          const SizedBox(
            height: 19,
          ),
          const Divider(),
          const SizedBox(height: 12),
          const Text(
            "Description",
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          const SizedBox(height: 12),
          Text(
            '${widget.productModel.description}',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, .5)),
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          const Text(
            "Sizes",
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
          const SizedBox(height: 12),
          SegmentedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Color.fromRGBO(69, 137, 216, 1);
                  }
                  return Color.fromRGBO(255, 255, 255, 1);
                },
              ),
            ),
            segments: const <ButtonSegment<Sizes>>[
              ButtonSegment<Sizes>(
                value: Sizes.small,
                label: Text("S"),
              ),
              ButtonSegment<Sizes>(
                value: Sizes.medium,
                label: Text("M"),
              ),
              ButtonSegment<Sizes>(
                value: Sizes.large,
                label: Text("L"),
              ),
              ButtonSegment<Sizes>(
                value: Sizes.extraLarge,
                label: Text("XL"),
              )
            ],
            selected: <Sizes>{sizesView},
            onSelectionChanged: (Set<Sizes> newSelection) {
              setState(() {
                sizesView = newSelection.first;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget ProductScreenName() {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        '${widget.productModel.name}',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 30,
            color: Color.fromRGBO(0, 0, 0, 1)),
      ),
    );
  }

  Widget ProductScreenPhoto(BuildContext context) {
    return CarouselSlider(
      carouselController: CarouselController(),
      items:
          widget.productModel.imagesURL?.where((url) => url != null).map((url) {
        return Builder(
          builder: (context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(0, 0, 0, .1)),
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height * .45,
          viewportFraction: 1,
          enableInfiniteScroll: false),
    );
  }

  Widget AddtoCartButton(BuildContext context) {
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
            child: Text(
              '\₱${widget.productModel.price}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 24,
                  color: Color.fromRGBO(0, 0, 0, 1)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 47,
              width: 150,
              child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(69, 137, 216, 1)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))),
                  ),
                  onPressed: () async {
                    UserProductModel model = UserProductModel(
                      imagesURL: widget.productModel.imagesURL,
                      name: widget.productModel.name,
                      category: widget.productModel.category,
                      description: widget.productModel.description,
                      brandName: widget.productModel.brandName,
                      countryOfOrigin: widget.productModel.countryOfOrigin,
                      price: widget.productModel.price,
                      productID: widget.productModel.productID,
                      productSellerID: widget.productModel.productSellerID,
                      inStock: widget.productModel.inStock,
                      itemCount: 1,
                    );
                    await UsersProductService.addProductToCart(
                        context: context, productModel: model);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add to Cart',
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
}
