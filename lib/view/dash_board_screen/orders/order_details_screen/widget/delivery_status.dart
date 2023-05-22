import 'package:aaptronix/view/dash_board_screen/orders/order_details_screen/widget/order_tracker.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../splash_screen.dart/spalsh_screen.dart';
// import 'package:order_tracker/order_tracker.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key, this.data, this.a}) : super(key: key);
  final data;
  final a;
  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  ///this TextDto present in a package add data in this dto and set in a list.

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller has processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.",
        "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];

  @override
  Widget build(BuildContext context) {
    return (widget.data['status'] == 'Cancelled'|| widget.a==true)
        ? CustomTextField(
            label: 'Order Status',
            ht: 65,
            width: mWidth!,
            num: false,
            max: 1,
            content: 'Order Cancelled',
            readOnly: true,
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 24, right: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight15,
                Text(
                  'Order Status',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                kHeight20,
                OrderTracker(
                  status: orderStatus(),
                  activeColor: Colors.green,
                  inActiveColor: Colors.grey[300],
                  // orderTitleAndDateList: orderList,
                  // shippedTitleAndDateList: shippedList,
                  // outOfDeliveryTitleAndDateList: outOfDeliveryList,
                  // deliveredTitleAndDateList: deliveredList,
                ),
              ],
            ),
          );
  }

  orderStatus() {
    switch (widget.data['status']) {
      case 'Ordered':
        return Status.order;

      case 'Shipped':
        return Status.shipped;

      case 'Out Of Delivery':
        return Status.outOfDelivery;

      case 'Delivered':
        return Status.delivered;

      // default:
    }
  }
}
