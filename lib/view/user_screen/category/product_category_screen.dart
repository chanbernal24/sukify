import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:sukify/controller/provider/product_category_provider/product_category.dart';
import 'package:sukify/controller/provider/users_product_provider/users_product_provider.dart';
import 'package:sukify/model/product_model.dart';
import 'package:sukify/view/user_screen/pages/product_screen/product_screen.dart';

class ProductCategoryScreen extends StatefulWidget {
  String? productCategory;
  ProductCategoryScreen({
    super.key,
    required this.productCategory,
  });

  @override
  State<ProductCategoryScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductCategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ProductBasedOnCategoryProvider>()
          .fetchProducts(category: widget.productCategory!);
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<ProductBasedOnCategoryProvider>(
                  builder: (context, UsersProductProvider, child) {
                if (UsersProductProvider.productsFetched == false) {
                  // return const Center(
                  //   child: CircularProgressIndicator(
                  //     color: Color.fromRGBO(0, 0, 0, .5),
                  //   ),
                  // );
                  return SizedBox();
                } else {
                  if (UsersProductProvider.products.isEmpty) {
                    return const Center(
                      child: Text(
                        'No products found',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(0, 0, 0, .2)),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        itemCount: UsersProductProvider.products.length,
                        physics: const ScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16),
                        itemBuilder: (context, index) {
                          ProductModel currentProduct =
                              UsersProductProvider.products[index];
                          return Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        child: ProductScreenDisplay(
                                            productModel: currentProduct),
                                        type: PageTransitionType.rightToLeft),
                                  );
                                },
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: MediaQuery.of(context).size.width * .5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      // ignore: unnecessary_string_interpolations
                                      image: NetworkImage(
                                          currentProduct.imagesURL![0]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: const Color.fromRGBO(0, 0, 0, .1),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                          Color.fromRGBO(0, 0, 0, .6),
                                          Color.fromRGBO(0, 0, 0, .5),
                                          Color.fromRGBO(0, 0, 0, .4),
                                          Color.fromRGBO(0, 0, 0, .3),
                                          Color.fromRGBO(0, 0, 0, .2),
                                          Color.fromRGBO(0, 0, 0, .1),
                                          Color.fromRGBO(0, 0, 0, 0),
                                          Color.fromRGBO(0, 0, 0, 0),
                                          Color.fromRGBO(0, 0, 0, 0),
                                        ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            overflow: TextOverflow.ellipsis,
                                            currentProduct.name!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Inter',
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  240, 240, 240, 1),
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            '₱${currentProduct.price!}',
                                            style: const TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  240, 240, 240, 1),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                }
              }),
            ],
          ),
        ),
      ),
    ));
  }

  Widget UserSearchBar() {
    return Container(
      height: 82.0,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .88,
            height: 52.0,
            child: TextField(
              controller: searchController,
              onSubmitted: (productName) {
                context
                    .read<UsersProductProvider>()
                    .getSearchedProducts(name: productName);
              },
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Color.fromRGBO(255, 255, 255, 1),
                hintText: 'Search....',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, .2),
                  fontFamily: 'Inter',
                ),
                contentPadding: const EdgeInsets.all(10),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(0, 0, 0, .2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, .3),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, .3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(69, 137, 216, .5),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, .3),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
