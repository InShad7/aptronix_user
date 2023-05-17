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
                List filteredList1 = [];
                for (int i = 0; i < data.length; i++) {
                  if (data[i]["username"] ==
                      FirebaseAuth.instance.currentUser!.email) {
                    filteredList1.add(data[i]);
                  }
                }

                return ListView.builder(
                    itemCount: filteredList1.length,
                    itemBuilder: (context, index) {
                      for (int i = 0; i < filteredList1.length; i++) {
                        filteredList.add(myProduct
                            .where((item) => filteredList1[i]['products']
                                .contains(item['id']))
                            .toList()
                          ..sort((a, b) => filteredList1
                              .indexOf(a['id'])
                              .compareTo(filteredList1.indexOf(b['id']))));
                      }

                      final product = filteredList[index];

                      return OrderedItemTile(
                          index: index, product: product[0], data: data[index]);
                    });
              }
            }
            return Text('Cant fetch data');
          }),
    );
  }
}
