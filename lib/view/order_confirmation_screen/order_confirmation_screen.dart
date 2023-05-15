import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key, this.status = false, this.id});

  final status;
  final id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: status ? 'Order Cancelled' : 'Order Confrimed'),
        body: status
            ? Text('Order Confrimed ${id}')
            : Image.asset('assets/tick.png'));
  }
}
