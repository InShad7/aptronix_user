import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:flutter/material.dart';

import '../../dash_board_screen/account/widget/update_btn.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Add address'),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView(
          children: [
            customTextField(
              label: 'Name',
              ht: 60,
              width: mWidth!,
              num: false,
              max: 2,
              content: '',
              readOnly: false,
            ),
            customTextField(
              label: 'Phone number',
              ht: 60,
              width: mWidth!,
              num: true,
              max: 1,
              content: '',
              readOnly: false,
            ),
            Row(
              children: [
                customTextField(
                  label: 'Pincode',
                  ht: 60,
                  width: mWidth! / 2.5,
                  num: true,
                  max: 1,
                  content: '',
                  readOnly: false,
                ),
                customTextField(
                  label: 'City',
                  ht: 60,
                  width: mWidth! / 2.4,
                  num: false,
                  max: 1,
                  content: '',
                  readOnly: false,
                ),
              ],
            ),
            customTextField(
              label: 'State',
              ht: 60,
              width: mWidth!,
              num: false,
              max: 2,
              content: '',
              readOnly: false,
            ),
            customTextField(
              label: 'House no: / building no:',
              ht: 60,
              width: mWidth!,
              num: false,
              max: 2,
              content: '',
              readOnly: false,
            ),
            customTextField(
              label: 'Area ,street',
              ht: 60,
              width: mWidth!,
              num: false,
              max: 2,
              content: '',
              readOnly: false,
            ),
            kHeight100,
            kHeight20,
            updateBtn(title: 'Save ', context: context),
          ],
        ),
      ),
    );
  }
}
