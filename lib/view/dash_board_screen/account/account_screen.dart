import 'package:aaptronix/view/dash_board_screen/account/widget/update_btn.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar( title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
           const DpImg(),
            CustomTextField(
              label: 'Name',
              ht: 70,
              width: mWidth!,
              num: false,
              max: 2,
              content: 'admin',
              readOnly: false,
            ),
            CustomTextField(
              label: "Email",
              ht: 70,
              width: mWidth!,
              num: false,
              max: 1,
              content: 'admin@gmail.com',
              readOnly: false,
            ),
            CustomTextField(
              label: 'Phone',
              ht: 70,
              width: mWidth!,
              num: true,
              max: 1,
              content: '9895989599',
              readOnly: false,
            ),
            kHeight100,
           const UpdateBtn(
              title: 'Update',
            ),
          ],
        ),
      ),
    );
  }
}

class DpImg extends StatefulWidget {
  const DpImg({super.key});

  @override
  State<DpImg> createState() => _DpImgState();
}

class _DpImgState extends State<DpImg> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      kHeight,
      const Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://img.freepik.com/premium-psd/character-avatar-3d-illustration_460336-712.jpg?w=740',
          ),
          radius: 110,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.edit_outlined),
      ),
    ]);
  }
}