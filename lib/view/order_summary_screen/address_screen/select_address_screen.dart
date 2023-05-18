import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/order_summary_screen/add_address_screen/add_address_screen.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/widget/title_and_btn.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../splash_screen.dart/spalsh_screen.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({super.key});

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  bool a = false;
  getRefresh(String refresh) {
    if (refresh == 'refresh') {
      setState(() {
        a = true;
      });
    }
  }

  void deleteAddress(int index) {
    setState(() {
      addressList.removeAt(index);
      Fluttertoast.showToast(
        msg: 'deleted',
        backgroundColor: deleteRed,
      );
      WishList my = WishList(
        wishList: myWishList,
        cart: myCart,
        count: countList,
        productTotal: myProductTotal,
        address: addressList,
        currentAddress: selectedAddress,
        buyNow: buyNowItem,
        buyNowCount: buyNowCount,
        buyNowTotal: buyNowTotals,
      );
      my.addToWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Address'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          TitleAndBtn(refresh: getRefresh),
          (addressList.isEmpty ||
                  addressList[0] == 'no data' ||
                  addressList == 'no data')
              ? CustomTextField(
                  label: ' ',
                  ht: 220,
                  width: mWidth!,
                  num: false,
                  max: 7,
                  content: 'add new address',
                  readOnly: true,
                  btn: false,
                  btnName: ' Add address',
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: addressList.length,
                  itemBuilder: (context, index) {
                    final bool isSelected =
                        addressList[index] == selectedAddress;
                    return RadioListTile(
                      activeColor: blue,
                      title: Container(
                        padding: const EdgeInsets.all(15),
                        // margin: const EdgeInsets.only(left: 16, right: 16, top: 5),
                        height: 240,
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(width: 1, color: grey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AddAddressScreen(
                                                  editAdd: true, index: index),
                                        ));
                                    if (result == 'refresh') {
                                      getRefresh('refresh');
                                    }
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
                                        buyNow: buyNowItem,
                                        buyNowCount: buyNowCount,
                                        buyNowTotal: buyNowTotals,
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
                      selected: selectedAddress != null &&
                          addressList[index] == selectedAddress,
                      onChanged: (value) {
                        setState(() {
                          selectedAddress = value;
                          Fluttertoast.showToast(
                            msg: 'Address selected',
                            backgroundColor: Colors.green,
                            fontSize: 15,
                          );

                          WishList my = WishList(
                            wishList: myWishList,
                            cart: myCart,
                            count: countList,
                            productTotal: myProductTotal,
                            address: addressList,
                            currentAddress: selectedAddress,
                            buyNow: buyNowItem,
                            buyNowCount: buyNowCount,
                            buyNowTotal: buyNowTotals,
                          );
                          my.addToWishList();
                          log('select ${selectedAddress.toString()}');
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
