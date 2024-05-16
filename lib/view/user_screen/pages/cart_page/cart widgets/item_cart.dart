import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sukify/constants/constants.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:sukify/model/user_product_model.dart';

class ItemCart extends StatefulWidget {
  const ItemCart({super.key});

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      itemCount: cartImages.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.16,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          child: Row(
            children: [
              RoundCheckBox(
                checkedWidget: Container(
                  color: const Color.fromRGBO(156, 192, 245, 1),
                ),
                size: 23,
                borderColor: const Color.fromRGBO(156, 192, 245, 1),
                onTap: (selected) {},
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color.fromRGBO(0, 0, 0, .05)),
                      borderRadius: BorderRadius.circular(14)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 12,
                          height: MediaQuery.of(context).size.height * 12,
                          margin: const EdgeInsets.all(8),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Image(
                            image: AssetImage(
                                'lib/assets/cart/${cartImages[index]}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartProductName[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  53, 53, 53, 1)),
                                        ),
                                        Text(
                                          cartProductBrand[index],
                                          overflow: TextOverflow.ellipsis,
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                        icon: Image.asset(
                                            'lib/assets/delete.png'),
                                        onPressed: () {},
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 31,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            240, 240, 240, 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Size:',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 1)),
                                        ),
                                      )),
                                  const SizedBox(width: 4),
                                  Text(
                                    cartProductSize[index],
                                    style: const TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                  const SizedBox(width: 23),
                                  Container(
                                      width: 31,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            240, 240, 240, 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Qty:',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 1)),
                                        ),
                                      )),
                                  const SizedBox(width: 4),
                                  Text(
                                    cartProductQuantity[index],
                                    style: const TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            240, 240, 240, 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                        icon: Image.asset('lib/assets/add.png'),
                                        onPressed: () {},
                                      )),
                                  SizedBox(width: 8),
                                  Text(
                                    cartProductQuantity[index],
                                    style: const TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            240, 240, 240, 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                        icon:
                                            Image.asset('lib/assets/minus.png'),
                                        onPressed: () {},
                                      )),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .15),
                                  Flexible(
                                    child: Text(
                                      '\$${cartProductPrice[index]}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10,
                                          color: Color.fromRGBO(53, 53, 53, 1)),
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
    );
  }
}
