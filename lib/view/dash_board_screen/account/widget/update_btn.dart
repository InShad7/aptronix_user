import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/address_model.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/order_summary_screen/add_address_screen/add_address_screen.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateBtn extends StatelessWidget {
  const UpdateBtn(
      {super.key,
      required this.title,
      this.index,
      this.update = false,
      this.updateProfile = false,
      this.refresh});
  final String title;
  final index;
  final update;
  final updateProfile;
  final refresh;
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
            if (updateProfile == true) {
              updateName();
              Fluttertoast.showToast(msg: 'Updated');
            } else {
              if (!formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Please provide a valid credentials',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                    ),
                    duration: const Duration(seconds: 2),
                    backgroundColor: deleteRed,
                  ),
                );
              } else {
                update ? updateAddress() : addAddress();
                log(addressList.length.toString());
                clear();
                Navigator.pop(context, 'refresh');
                // refresh();
              }
            }
          },
          child: Text(
            title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 26, color: white),
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
    Fluttertoast.showToast(
      msg: 'updated',
      backgroundColor: Colors.green,
      fontSize: 15,
    );
    updateFirebase();
    clear();
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
    Fluttertoast.showToast(
      msg: 'Address added',
      backgroundColor: Colors.green,
      fontSize: 15,
    );

    updateFirebase();
    clear();
  }
}
