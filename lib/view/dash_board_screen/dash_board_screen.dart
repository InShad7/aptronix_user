import 'package:aaptronix/view/dash_board_screen/account/account_screen.dart';
import 'package:aaptronix/view/dash_board_screen/orders/order_list_screen.dart';
import 'package:aaptronix/view/dash_board_screen/widget/dashboard_list.dart';
import 'package:aaptronix/view/dash_board_screen/widget/logout_btn.dart';
import 'package:aaptronix/view/dash_board_screen/widget/user_img_name.dart';
import 'package:aaptronix/view/login_screen/login_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:flutter/material.dart';


class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navScreenAppBar(title: 'Dashboard'),
      body: ListView(children: [
        userImgAndName(),
        dashboardList(
          context: context,
          label: 'Your Order',
          navigateTo: OrderListScreen(),
        ),
        dashboardList(
            label: "Your Account",
            navigateTo: AccountScreen(),
            context: context),
        dashboardList(
            label: "Privacy Policy",
            navigateTo: OrderListScreen(),
            context: context),
        kHeight100,
        customBtn(
          context: context,
          title: 'Log Out',
          navigateTo: LoginScreen(),
        ),
      ]),
    );
  }
}
