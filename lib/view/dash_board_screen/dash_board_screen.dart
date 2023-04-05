import 'package:aaptronix/view/dash_board_screen/widget/dashboard_list.dart';
import 'package:aaptronix/view/dash_board_screen/widget/logout_btn.dart';
import 'package:aaptronix/view/dash_board_screen/widget/user_img_name.dart';
import 'package:aaptronix/view/login_screen/login_screen.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navScreenAppBar(title: 'Dashboard'),
      body: ListView(children: [
        userImgAndName(),
        dashboardList(),
        kHeight100,
        customBtn(
            context: context,
            title: 'LogOut',
            navigateTo: LoginScreen(),
            ),
      ]),
    );
  }
}

