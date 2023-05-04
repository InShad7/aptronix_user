import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/order_summary_screen/add_address_screen/widget/custom_field2.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../dash_board_screen/account/widget/update_btn.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Add address'),
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
              controller: nameController,
              readOnly: false,
            ),
            kHeight,
            customField2(
              label: 'Phone number',
              height: 60,
              width: mWidth!,
              num: true,
              max: 1,
              controller: phoneController,
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
                  controller: pincodeController,
                  readOnly: false,
                ),
                customField2(
                  label: 'City',
                  height: 60,
                  width: mWidth! / 2.4,
                  num: false,
                  max: 1,
                  controller: cityController,
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
              controller: stateController,
              readOnly: false,
            ),
            kHeight,
            customField2(
              label: 'House no: / building no:',
              height: 60,
              width: mWidth!,
              num: false,
              max: 3,
              controller: houseController,
              readOnly: false,
            ),
            kHeight,
            customField2(
              label: 'Area ,street',
              height: 60,
              width: mWidth!,
              num: false,
              max: 3,
              controller: streetController,
              readOnly: false,
            ),
            kHeight,
            kHeight100,
            kHeight20,
            UpdateBtn(title: 'Save '),
          ],
        ),
      ),
    );
  }
}
