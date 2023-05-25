import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/cart_screen/widget/cart_card.dart';
import 'package:aaptronix/view/dash_board_screen/orders/order_details_screen/widget/delivery_status.dart';
import 'package:aaptronix/view/dash_board_screen/widget/logout_btn.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, this.product, this.index, this.data});
  final product;
  final index;
  final data;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool a = false;

  void refresh() {
    setState(() {
      a = true;
    });
  }

  Future<bool> onWillPop() async {
    Navigator.pop(context, 'refresh');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: MyAppBar(title: "Order Details"),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          kHeight20,
          CartCard(
            quantity: false,
            product: widget.product,
            index: widget.index,
            data: widget.data,
          ),
          kHeight,
          CustomTextField(
            label: 'Total Amount',
            ht: 65,
            width: mWidth!,
            num: false,
            max: 1,
            content:
                '${int.parse(widget.product['price']) * widget.data['count']}   -  ${widget.data['payment']}',
            readOnly: true,
          ),
          kHeight,
          CustomTextField(
            label: 'Address',
            ht: 200,
            width: mWidth!,
            num: false,
            max: 10,
            content:
                "${widget.data['address']['name']}\n${widget.data['address']['houseNumber']}\n${widget.data['address']['streetName']}\n${widget.data['address']['city']}\n${widget.data['address']['state']}\n${widget.data['address']['pincode']}\n${widget.data['address']['phoneNumber']}\n",
            readOnly: true,
          ),
          kHeight,
          StatusPage(data: widget.data, a: a),
          (widget.data['status'] == 'Cancelled' ||
                  a == true ||
                  widget.data['status'] == 'Delivered')
              ? const Text('')
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 45,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        alertBox(
                          context: context,
                          cancel: true,
                          data: widget.data,
                          product: widget.product,
                          refresh: refresh,
                        );
                      },
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}
