import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/widget/title_and_btn.dart';
import 'package:aaptronix/view/order_summary_screen/edit_address_screen/edit_address.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({super.key});

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

dynamic selectedAddress;

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  void deleteAddress(int index) {
    setState(() {
      addressList.removeAt(index);
      WishList my = WishList(
        wishList: myWishList,
        cart: myCart,
        count: countList,
        productTotal: myProductTotal,
        address: addressList,
        currentAddress: selectedAddress,
      );
      my.addToWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    log(selectedAddress.toString());
    return Scaffold(
      appBar: MyAppBar(title: 'Address'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const TitleAndBtn(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: addressList.length,
            itemBuilder: (context, index) {
              return RadioListTile(
                activeColor: blue,
                title: Container(
                  padding: const EdgeInsets.all(15),
                  // margin: const EdgeInsets.only(left: 16, right: 16, top: 5),
                  height: 200,
                  decoration: BoxDecoration(
                    color: cardClr,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "${addressList[index]['name']}\n${addressList[index]['houseNumber']}\n${addressList[index]['streetName']}\n${addressList[index]['city']}\n${addressList[index]['state']}\n${addressList[index]['pincode']}\n${addressList[index]['phoneNumber']}\n",
                          style: GoogleFonts.roboto(
                            height: 1.3,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditAddressScreen(index: index),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit_outlined),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteAddress(index);
                              if (addressList.isEmpty) {
                                selectedAddress = 'no data';

                                WishList my = WishList(
                                  wishList: myWishList,
                                  cart: myCart,
                                  count: countList,
                                  productTotal: myProductTotal,
                                  address: addressList,
                                  currentAddress: selectedAddress,
                                );
                                my.addToWishList();
                                getWishList();
                              }
                              log(addressList.length.toString());
                            },
                            icon: const Icon(Icons.delete_outlined),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                value: addressList[index],
                groupValue: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value;
                    WishList my = WishList(
                      wishList: myWishList,
                      cart: myCart,
                      count: countList,
                      productTotal: myProductTotal,
                      address: addressList,
                      currentAddress: selectedAddress,
                    );
                    my.addToWishList();
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
