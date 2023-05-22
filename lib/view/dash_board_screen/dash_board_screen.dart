import 'package:aaptronix/view/dash_board_screen/account/account_screen.dart';
import 'package:aaptronix/view/dash_board_screen/orders/order_list_screen.dart';
import 'package:aaptronix/view/dash_board_screen/widget/dashboard_list.dart';
import 'package:aaptronix/view/dash_board_screen/widget/logout_btn.dart';
import 'package:aaptronix/view/dash_board_screen/widget/user_img_name.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool a = false;
  void refresh() {
    setState(() {
      a = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavScreenAppBar(title: 'Dashboard'),
      body: ListView(children: [
        UserImgAndName(),
        DashboardList(
          label: 'Your Order',
          navigateTo: OrderListScreen(),
        ),
        DashboardList(
          label: "Your Account",
          navigateTo: AccountScreen(),
          refresh: refresh,
        ),
        DashboardList(
          label: "Privacy Policy",
          privacy: true,
        ),
        DashboardList(
          label: "Terms and Conditions",
          terms: true,
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
