import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/controller/provider/address_provider.dart';
import 'package:sukify/controller/services/user_product_services/user_product_services.dart';
import 'package:sukify/model/address_model.dart';
import 'package:sukify/model/user_product_model.dart';
import 'package:sukify/view/onboardingScreen/onboard_screen.dart';

class SellerMenuScreen extends StatefulWidget {
  const SellerMenuScreen({super.key});

  @override
  State<SellerMenuScreen> createState() => _SellerMenuScreenState();
}

class _SellerMenuScreenState extends State<SellerMenuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AddressProvider>().getCurrentSelectedAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            SellerMenuGreet(),
            const SizedBox(height: 30),
            // // SellerAboutBtn(context),
            // const SizedBox(height: 135),
            SellerLogoutBtn(context),
            StreamBuilder<List<UserProductModel>>(
                stream: UsersProductService.fetchAllOrders(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Text(
                          'Oops! No orders yet',
                        ),
                      );
                    } else {
                      List<UserProductModel> orders = snapshot.data!;
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'All Orders',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                              physics: const ScrollPhysics(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16),
                              itemCount: orders.length,
                              itemBuilder: (content, index) {
                                UserProductModel currentProduct = orders[index];

                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width * .4,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      // ignore: unnecessary_string_interpolations
                                      image: NetworkImage(
                                          '${currentProduct.imagesURL![0]}'),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              currentProduct.name!,
                                              style: const TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    240, 240, 240, 1),
                                              ),
                                            ),
                                            Text(
                                              '\₱${currentProduct.price}',
                                              style: const TextStyle(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 10,
                                                color: Color.fromRGBO(
                                                    240, 240, 240, 1),
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
                          )
                        ],
                      );
                    }
                  }
                  if (snapshot.hasError) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Text(
                        'Oops! There was An error',
                      ),
                    );
                  } else {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Text(
                        'Oops! No Order Found',
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget SellerMenuGreet() {
    return Consumer<AddressProvider>(
      builder: (context, value, child) {
        AddressModel selectedAddress = value.currentSelectedAddress;
        return Center(
          child: Column(
            children: [
              CircleAvatar(
                  radius: 27,
                  backgroundImage: AssetImage('lib/assets/miles.jpg')),
              SizedBox(height: 12),
              Text(
                'Hello, ${selectedAddress.name}!' ?? "",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, .5)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget SellerAboutBtn(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, .5),
          ),
          borderRadius: BorderRadius.circular(14)),
      child: FilledButton.icon(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(255, 255, 255, 1)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
          ),
          onPressed: () {},
          icon: const Icon(Icons.info_outline,
              color: Color.fromRGBO(0, 0, 0, .5)),
          label: const Text(
            'About',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, .5)),
          )),
    );
  }

  Widget SellerLogoutBtn(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FilledButton.icon(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(239, 82, 82, 1)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
          ),
          onPressed: () {
            auth.signOut();
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    child: OnboardingScreen(),
                    type: PageTransitionType.leftToRight),
                (route) => false);
          },
          icon: const Icon(Icons.person_outline,
              color: Color.fromRGBO(240, 240, 240, 1)),
          label: const Text(
            'Logout',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromRGBO(240, 240, 240, 1)),
          )),
    );
  }
}
