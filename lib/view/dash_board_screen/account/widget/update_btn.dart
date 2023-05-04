import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/address_model.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateBtn extends StatelessWidget {
  const UpdateBtn(
      {super.key, required this.title, this.index, this.update = false});
  final String title;
  final index;
  final update;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 55,
        width: mWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          onPressed: () {
            update ? updateAddress() : addAddress();
            log(addressList.length.toString());
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SelectAddressScreen(),
            //   ),
            // );
            Navigator.pop(context);
          },
          child: Text(
            title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 26),
            ),
          ),
        ),
      ),
    );
  }

  void updateAddress() {
    Map<String, dynamic> newAddress = {
      'name': nameController.text,
      'houseNumber': houseController.text,
      'streetName': streetController.text,
      'city': cityController.text,
      'state': stateController.text,
      'pincode': pincodeController.text,
      'phoneNumber': phoneController.text,
    };

    addressList[index] = newAddress;
    WishList myCartObj = WishList(
      wishList: myWishList,
      cart: myCart,
      count: countList,
      productTotal: myProductTotal,
      address: addressList,
      currentAddress: selectedAddress,
    );
    myCartObj.addToWishList();
  }

  void addAddress() {
    Address addressObj = Address(
      name: nameController.text,
      phoneNumber: phoneController.text,
      pincode: pincodeController.text,
      city: cityController.text,
      state: stateController.text,
      houseNumber: houseController.text,
      streetName: streetController.text,
    );
    addressObj.addAdress();
    WishList myCartObj = WishList(
      wishList: myWishList,
      cart: myCart,
      count: countList,
      productTotal: myProductTotal,
      address: addressList,
      currentAddress: selectedAddress,
    );
    myCartObj.addToWishList();
  }
}
