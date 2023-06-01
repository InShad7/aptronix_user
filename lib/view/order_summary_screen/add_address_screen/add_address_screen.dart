import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/order_summary_screen/add_address_screen/widget/custom_field2.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../dash_board_screen/account/widget/update_btn.dart';

final formKey = GlobalKey<FormState>();

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen(
      {super.key, this.editAdd = false, this.index, this.refrsh});
  final index;
  final editAdd;
  final refrsh;

  @override
  Widget build(BuildContext context) {
    if (!editAdd) {
      clear();
    }
    return Scaffold(
      appBar: MyAppBar(title: editAdd ? 'Edit address' : 'Add address'),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              customField2(
                  label: 'Name',
                  height: 60,
                  width: mWidth!,
                  num: false,
                  max: 1,
                  controller: editAdd
                      ? nameController = TextEditingController(
                          text: addressList[index]['name'])
                      : nameController,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Name can\'t be empty';
                    }
                  }),
              kHeight,
              customField2(
                  label: 'Phone number',
                  height: 60,
                  width: mWidth!,
                  num: true,
                  max: 1,
                  controller: editAdd
                      ? phoneController = TextEditingController(
                          text: addressList[index]['phoneNumber'])
                      : phoneController,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Number can\'t be empty';
                    }
                  },
                  number: true),
              kHeight,
              Row(
                children: [
                  customField2(
                    label: 'Pincode',
                    height: 60,
                    width: mWidth! / 2.5,
                    num: true,
                    max: 1,
                    controller: editAdd
                        ? pincodeController = TextEditingController(
                            text: addressList[index]['pincode'])
                        : pincodeController,
                    readOnly: false,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'pincode can\'t be empty';
                      }
                    },
                    number: true,
                  ),
                  customField2(
                      label: 'City',
                      height: 60,
                      width: mWidth! / 2.4,
                      num: false,
                      max: 1,
                      controller: editAdd
                          ? cityController = TextEditingController(
                              text: addressList[index]['city'])
                          : cityController,
                      readOnly: false,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'city can\'t be empty';
                        }
                      }),
                ],
              ),
              kHeight,
              customField2(
                  label: 'State',
                  height: 60,
                  width: mWidth!,
                  num: false,
                  max: 1,
                  controller: editAdd
                      ? stateController = TextEditingController(
                          text: addressList[index]['state'])
                      : stateController,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'state can\'t be empty';
                    }
                  }),
              kHeight,
              customField2(
                  label: 'House no: / building no:',
                  height: 60,
                  width: mWidth!,
                  num: false,
                  max: 3,
                  house: true,
                  controller: editAdd
                      ? houseController = TextEditingController(
                          text: addressList[index]['houseNumber'])
                      : houseController,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'House can\'t be empty';
                    }
                  }),
              kHeight,
              customField2(
                  label: 'Area ,street',
                  height: 60,
                  width: mWidth!,
                  num: false,
                  max: 3,
                  controller: editAdd
                      ? streetController = TextEditingController(
                          text: addressList[index]['streetName'])
                      : streetController,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Street can\'t be empty';
                    }
                  }),
              kHeight,
              kHeight100,
              kHeight20,
              UpdateBtn(
                  title: 'Save ',
                  index: index,
                  update: editAdd ? true : false,
                  refresh: refrsh
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
