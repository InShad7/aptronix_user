import 'dart:developer';

import 'package:aaptronix/controller/provider/google_signin.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/controller.dart';
import '../../../model/wish_list_model.dart';

// bool logout = false;

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.title});
  final String title;
  // final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 55,
        width: mWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () {
           
            alertBox(context: context);
          
          },
          child: Text(
            title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 24, color: white),
            ),
          ),
        ),
      ),
    );
  }
}

void alertBox({
  context,
  delete = false,
  index,
  deleteFun,
  cancel = false,
  data,
  product,
  refresh,
}) {
  showModalBottomSheet(
    backgroundColor: cardClr2,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(18),
        bottom: Radius.circular(18),
      ),
    ),

    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        kHeight,
        SizedBox(
          width: 400,
          height: 60,
          child: TextButton(
            onPressed: () async {
              if (cancel == true) {
                updateStatus(data, product, 'Cancelled');
                await updateList();
                refresh();
                Navigator.pop(context);
                Fluttertoast.showToast(msg: 'Order has been cancelled');
              } else if (delete == true) {
                deleteFun(index);

                if (addressList.isEmpty) {
                  selectedAddress = 'no data';

                  updateFirebase();
                  getWishList();
                }
                log(addressList.length.toString());
              } else {
                if (flag == 1) {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogout();
                  Navigator.pop(context);
                } else {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                }
              }
            },
            child: Text(
              delete
                  ? 'Delete'
                  : cancel
                      ? 'Cancel Order'
                      : 'Logout',
              style: GoogleFonts.roboto(color: Colors.teal, fontSize: 18),
            ),
          ),
        ),
        // kHeight,
        const Divider(indent: 60, endIndent: 60),
        SizedBox(
          height: 50,
          width: 400,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: GoogleFonts.roboto(color: red, fontSize: 18),
            ),
          ),
        ),
        kHeight,
      ],
    ),

    // ),
  );
}
