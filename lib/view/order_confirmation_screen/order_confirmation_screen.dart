import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key, this.status, this.id});

  final status;
  final id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: status ? 'Order Confrimed' : 'Order Cancelled'),
        body: status
            ? Text('Order Confrimed ${id}')
            : Image.asset('assets/fast-delivery-mobile_86047-160.jpeg'));
  }
}
