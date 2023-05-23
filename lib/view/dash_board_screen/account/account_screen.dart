import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/dash_board_screen/account/widget/update_btn.dart';
import 'package:aaptronix/view/order_summary_screen/add_address_screen/widget/custom_field2.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  final bool profile = true;

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      Navigator.pop(context, 'refresh');
      return true;
    }

    User user = FirebaseAuth.instance.currentUser!;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: MyAppBar(title: 'Profile'),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const DpImg(),
              kHeight20,
              kHeight20,
              customField2(
                  label: 'Name',
                  height: 60,
                  width: mWidth!,
                  num: false,
                  max: 1,
                  controller: profile
                      ? nameUpdateController =
                          TextEditingController(text: user.displayName)
                      : nameUpdateController,
                  readOnly: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Name can\'t be empty';
                    }
                  }),
              customField2(
                  label: 'Email',
                  height: 60,
                  width: mWidth!,
                  num: false,
                  max: 1,
                  controller: TextEditingController(text: user.email),
                  readOnly: true,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Name can\'t be empty';
                    }
                  }),
              kHeight100,
              const UpdateBtn(
                title: 'Update',
                updateProfile: true,
              ),
            ],
          ),
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
    final user = FirebaseAuth.instance.currentUser!;
    return Column(children: [
      kHeight,
      Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(user.photoURL ??
              'https://img.freepik.com/premium-psd/character-avatar-3d-illustration_460336-712.jpg?w=740'),
          maxRadius: 80,
        ),
      ),
      kHeight20
      // IconButton(
      //   onPressed: () {},
      //   icon: Icon(Icons.edit_outlined),
      // ),
    ]);
  }
}
