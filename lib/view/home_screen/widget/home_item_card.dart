import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/home_screen/product_details/product_details.dart';
import 'package:aaptronix/view/home_screen/widget/fav_icon.dart';
import 'package:aaptronix/view/home_screen/widget/home_item_tile.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeItemCards extends StatefulWidget {
  HomeItemCards({super.key, this.search = false, this.category = false});
  final search;
  final category;

  @override
  State<HomeItemCards> createState() => _HomeItemCardsState();
}

class _HomeItemCardsState extends State<HomeItemCards> {
  bool a = false;
  void getUpdate(String refresh) {
    setState(() {
      if (refresh == 'refresh') {
        a = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    log('home cards rebuilded');
    if (buyNow.isNotEmpty) {
      buyNow.clear();
      buyNowItem = '';
      log('buy from build ${buyNow}');
      log('buy from build ${buyNowItem}');
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (widget.search || widget.category) ? '' : "New Arrival",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          kHeight,
          (widget.search
                      ? searchList.length
                      : widget.category
                          ? categoryList.length
                          : myProduct.length) >
                  0
             
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: (mHeight! > 925) ? 0.74 : 0.63,
                  ),
                  itemCount: widget.search
                      ? searchList.length
                      : widget.category
                          ? categoryList.length
                          : myProduct.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product = widget.search
                        ? searchList[index]
                        : widget.category
                            ? categoryList[index]
                            : myProduct[index];
                    log(searchList.length.toString());
                    return homeItemTile(context:context,product:product,getUpdate: getUpdate);
                    // : null;
                  })
              : Center(child: Image.asset('assets/nomatchfound.jpeg'))
        ],
      ),
    );
  }
}
