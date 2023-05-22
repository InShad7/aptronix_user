import 'package:aaptronix/view/dash_board_screen/account/account_screen.dart';
import 'package:aaptronix/view/dash_board_screen/orders/order_list_screen.dart';
import 'package:aaptronix/view/dash_board_screen/widget/dashboard_list.dart';
import 'package:aaptronix/view/dash_board_screen/widget/logout_btn.dart';
import 'package:aaptronix/view/dash_board_screen/widget/user_img_name.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavScreenAppBar(title: 'Dashboard'),
      body: ListView(children: const [
        UserImgAndName(),
        DashboardList(
          label: 'Your Order',
          navigateTo: OrderListScreen(),
        ),
        DashboardList(
          label: "Your Account",
          navigateTo: AccountScreen(),
        ),
        DashboardList(
          label: "Privacy Policy",
          navigateTo: OrderListScreen(),
        ),
        kHeight100,
        CustomBtn(
          title: 'Log Out',
          // navigateTo: LoginScreen(),
        ),
      ]),
    );
  }
}
