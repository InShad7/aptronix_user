import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/dash_board_screen/orders/widget/ordered_Item_tile.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../splash_screen.dart/spalsh_screen.dart';

List orderItem = ['iPhone 12', 'iPad Pro', 'Mac air', 'iWatch 7'];

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orderClr,
      appBar: MyAppBar(title: "Orders"),
      body: StreamBuilder(
          stream: getOrder(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SizedBox(
                height: 50,
                width: 50,
                child: LoadingIndicator(
                  indicatorType: Indicator.circleStrokeSpin,
                  colors: [blue],
                  strokeWidth: 1,
                ),
              ));
            }
            if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                List filteredList = [];
                List filteredList1 = data
                    .where((item) =>
                        item['username'] ==
                        FirebaseAuth.instance.currentUser!.email)
                    .toList();

                return filteredList1.isEmpty
                    ? Center(
                        child: Image.asset('assets/no_order.png'),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: filteredList1.length,
                        itemBuilder: (context, index) {
                          final filteredList = filteredList1
                              .expand((item) => myProduct
                                  .where((product) =>
                                      item['products'].contains(product['id']))
                                  .toList()
                                ..sort((a, b) => filteredList1
                                    .indexOf(a['id'])
                                    .compareTo(filteredList1.indexOf(b['id']))))
                              .toList();

                          final product = filteredList[index];

                          return OrderedItemTile(
                              index: index,
                              product: product,
                              data: filteredList1[index]);
                        });
              }
            }
            return Text('Cant fetch data');
          }),
    );
  }
}
