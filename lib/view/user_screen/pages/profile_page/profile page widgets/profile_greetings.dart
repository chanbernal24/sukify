import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sukify/controller/provider/address_provider.dart';
import 'package:sukify/model/address_model.dart';

class ProfileGreetings extends StatefulWidget {
  ProfileGreetings({super.key});

  @override
  State<ProfileGreetings> createState() => _ProfileGreetingsState();
}

class _ProfileGreetingsState extends State<ProfileGreetings> {
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
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('lib/assets/miles.jpg'),
          ),
          const SizedBox(height: 24),
          // Text(
          //   'Hello, Miles Morales',
          //   style: TextStyle(
          //       fontFamily: 'Inter',
          //       fontSize: 20,
          //       fontWeight: FontWeight.w600,
          //       color: Color.fromRGBO(0, 0, 0, 1)),
          // ),
          Consumer<AddressProvider>(
            builder: (context, addressProvider, child) {
              if (addressProvider.fetchedCurrentSelectedAddress == true) {
                AddressModel selectedAddress =
                    addressProvider.currentSelectedAddress;
                return Row(
                  children: [
                    Text(
                      "Hello, ${selectedAddress.name}",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ],
                );
              } else {
                return Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Color.fromRGBO(0, 0, 0, .2),
                    ),
                    Text("Name")
                  ],
                );
              }
            },
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Color.fromRGBO(0, 0, 0, .5),
                size: 25,
              ),
              SizedBox(width: 3),
              Flexible(
                child: Consumer<AddressProvider>(
                  builder: (context, addressProvider, child) {
                    if (addressProvider.fetchedCurrentSelectedAddress == true) {
                      AddressModel selectedAddress =
                          addressProvider.currentSelectedAddress;
                      return Row(
                        children: [Text("${selectedAddress.city}")],
                      );
                    } else {
                      return Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Color.fromRGBO(0, 0, 0, .2),
                          ),
                          Text("City")
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
