import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, this.quantity = true, this.data});
  final data;
  final bool quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
      child: Container(
        height: 115,
        decoration: BoxDecoration(
          color: cardClr,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 95,
                width: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                ),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Image.asset('assets/APPRONIX.jpg'),
                  imageUrl:
                      'https://www.reliancedigital.in/medias/Apple-iPhone-13-Smartphones-492849504-i-1-1200Wx1200H-300Wx300H?context=bWFzdGVyfGltYWdlc3w0MjUzMnxpbWFnZS9qcGVnfGltYWdlcy9oYjEvaDZjLzk4ODAzNjMwNzM1NjYuanBnfGVkODc3NTQ1MDE0NmFiMDExZDY4MzFhYTM1MWM2OWM4OTM5MjljNTI3MTZhZjBmYzc2MTc2NzVhMjBjZjdmNDI',
                ),
              ),
              kWidth,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 280,
                        child: Text(
                          'name',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                  kHeight,
                  Text(
                    'size GB',
                    style:
                        GoogleFonts.roboto(textStyle: TextStyle(fontSize: 17)),
                  ),
                  Row(
                    children: [
                      Text(
                        '₹ price',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: quantity
                            ? const EdgeInsets.only(left: 86.5)
                            : EdgeInsets.only(left: 150),
                        child: Row(
                          children: [
                            quantity
                                ? Text('')
                                : Text(
                                    'Qty:',
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(fontSize: 17),
                                    ),
                                  ),
                            kWidth,
                            Visibility(
                              visible: quantity,
                              child: IconButton(
                                onPressed: () {
                                 
                                  print('remove');
                                },
                                icon: Icon(Icons.remove),
                              ),
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
                                  '1',
                                  style: GoogleFonts.roboto(
                                    textStyle:
                                        TextStyle(fontSize: 18, color: white),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: quantity,
                              child: IconButton(
                                onPressed: () {
                                  print('add');
                                },
                                icon: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
