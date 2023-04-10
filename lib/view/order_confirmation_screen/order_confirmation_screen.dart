import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Order Confirmation Page'),
    );
  }
}
