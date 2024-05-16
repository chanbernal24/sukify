import 'package:flutter/material.dart';
import 'package:sukify/constants/constants.dart';
import 'package:sukify/controller/services/user_product_services/user_product_services.dart';
import 'package:sukify/model/user_product_model.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserProductModel>>(
        stream: UsersProductService.fetchOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  'Oops! You didn\'t order anything yet',
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
                          'Your Orders',
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                    Text(
                                      '\₱${currentProduct.price}',
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
        });
  }
}
