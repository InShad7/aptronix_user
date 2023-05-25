import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/dash_board_screen/orders/widget/ordered_Item_tile.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';


class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  bool a = false;
  void refresh() {
    setState(() {
      a = true;
    });
  }

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
                            data: filteredList1[index],
                            refresh: refresh,
                          );
                        });
              }
            }
            return const Text('Cant fetch data');
          }),
    );
  }
}
