import 'package:flutter/material.dart';
import 'package:sukify/constants/constants.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({super.key});

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  @override
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
      floatingActionButton: ExtendedFAB(),
    );
  }

  Widget SellerProfileDisplay() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, .1)),
      ),
      child: const Row(
        children: [
          CircleAvatar(
              radius: 27, backgroundImage: AssetImage('lib/assets/miles.jpg')),
          SizedBox(width: 8),
          Text('Felicorps',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Color.fromRGBO(0, 0, 0, .5))),
        ],
      ),
    );
  }

  SizedBox SellerProductList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
        itemCount: orderHistoryPhoto.length,
        itemBuilder: (content, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .4,
            decoration: BoxDecoration(
              image: DecorationImage(
                // ignore: unnecessary_string_interpolations
                image: AssetImage('${orderHistoryPhoto[index]}'),
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
                        orderHistoryProduct[index],
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: Color.fromRGBO(240, 240, 240, 1),
                        ),
                      ),
                      Text(
                        '\$${orderHistoryPrices[index]}',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          color: Color.fromRGBO(240, 240, 240, 1),
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
  }

  Widget ExtendedFAB() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 65,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, .1)),
      ),
      child: FloatingActionButton.extended(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        onPressed: () {},
        backgroundColor: Color.fromRGBO(69, 137, 216, 1),
        label: const Text(
          'Add',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        icon: Icon(Icons.add_sharp, color: Color.fromRGBO(255, 255, 255, 1)),
      ),
    );
  }
}
