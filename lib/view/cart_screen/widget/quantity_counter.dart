import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantityCounter extends StatefulWidget {
  QuantityCounter({
    super.key,
    this.product,
    this.onRemove,
    required this.updateTotal,
    this.index,
    this.buynow = false,
  });
  final product;
  final onRemove;
  final updateTotal;
  final index;
  final buynow;
  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  @override
  Widget build(BuildContext context) {
    getWishList();
    int count = widget.buynow ? buyNowCount : countList[widget.index];
    log(' count ${count.toString()}');
    log(' counlist ${countList.toString()}');
    return Row(
      children: [
        kWidth,
        IconButton(
          onPressed: () {
            setState(() {
              if (widget.buynow ? buyNowCount == 1 : count == 1) {
                widget.buynow
                    ? buyNowItem = ''
                    : widget.onRemove(widget.product['id']);
                log(countList.toString());
                widget.buynow
                    ? buyNowCount = 0
                    : countList.removeAt(widget.index);
                widget.buynow
                    ? buyNowTotals = 0
                    : myProductTotal.removeAt(widget.index);

                updateFirebase();
                widget.updateTotal();

                Fluttertoast.showToast(
                  msg: "Item removed from cart 🛒",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: black,
                  textColor: Colors.white,
                  fontSize: 15.0,
                );

                // print('remove');
              } else {
                widget.buynow ? buyNowCount-- : count--;
                widget.buynow ? buyNowCount : countList[widget.index] = count;
                widget.buynow
                    ? buyNowTotals =
                        buyNowCount * int.parse(widget.product['price'])
                    : myProductTotal[widget.index] =
                        count * int.parse(widget.product['price']);

                updateFirebase();
                widget.updateTotal();

                log(count.toString());
              }
            });
          },
          icon: const Icon(Icons.remove),
        ),
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              widget.buynow ? '${buyNowCount}' : '${count}',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 18, color: white),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (widget.product['quantity'] == count) {
                Fluttertoast.showToast(
                  msg: "Limit exceeded 🛒",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: red,
                  textColor: Colors.white,
                  fontSize: 15.0,
                );
              } else {
                widget.buynow ? buyNowCount++ : count++;
                widget.buynow ? buyNowCount : countList[widget.index] = count;
                widget.buynow
                    ? buyNowTotals =
                        buyNowCount * int.parse(widget.product['price'])
                    : myProductTotal[widget.index] =
                        count * int.parse(widget.product['price']);
                updateFirebase();
                widget.updateTotal();
              }

              log(count.toString());
            });

            // print('add');
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
