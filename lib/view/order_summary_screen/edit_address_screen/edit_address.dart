import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/order_summary_screen/add_address_screen/widget/custom_field2.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../dash_board_screen/account/widget/update_btn.dart';

class EditAddressScreen extends StatelessWidget {
  EditAddressScreen({super.key, this.index});
  final index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Edit address'),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView(
          children: [
            customField2(
              label: 'Name',
              height: 60,
              width: mWidth!,
              num: false,
              max: 1,
              controller: nameController =
                  TextEditingController(text: addressList[index]['name']),
              readOnly: false,
            ),
            kHeight,
            customField2(
              label: 'Phone number',
              height: 60,
              width: mWidth!,
              num: true,
              max: 1,
              controller: phoneController = TextEditingController(
                  text: addressList[index]['phoneNumber']),
              readOnly: false,
            ),
            kHeight,
            Row(
              children: [
                customField2(
                  label: 'Pincode',
                  height: 60,
                  width: mWidth! / 2.5,
                  num: true,
                  max: 1,
                  controller: pincodeController = TextEditingController(
                      text: addressList[index]['pincode']),
                  readOnly: false,
                ),
                customField2(
                  label: 'City',
                  height: 60,
                  width: mWidth! / 2.4,
                  num: false,
                  max: 1,
                  controller: cityController =
                      TextEditingController(text: addressList[index]['city']),
                  readOnly: false,
                ),
              ],
            ),
            kHeight,
            customField2(
              label: 'State',
              height: 60,
              width: mWidth!,
              num: false,
              max: 1,
              controller: stateController =
                  TextEditingController(text: addressList[index]['state']),
              readOnly: false,
            ),
            kHeight,
            customField2(
              label: 'House no: / building no:',
              height: 60,
              width: mWidth!,
              num: false,
              max: 3,
              controller: houseController = TextEditingController(
                  text: addressList[index]['houseNumber']),
              readOnly: false,
            ),
            kHeight,
            customField2(
              label: 'Area ,street',
              height: 60,
              width: mWidth!,
              num: false,
              max: 3,
              controller: streetController =
                  TextEditingController(text: addressList[index]['streetName']),
              readOnly: false,
            ),
            kHeight,
            kHeight100,
            kHeight20,
            UpdateBtn(title: 'Save ', index: index, update: true),
          ],
        ),
      ),
    );
  }
}
