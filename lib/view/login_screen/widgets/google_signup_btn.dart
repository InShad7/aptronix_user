import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/controller/provider/google_signin.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Widget googleSignUpBtn(context) {
  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
         
          InkWell(
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                // color: grey,
                border: Border.all(width: 1, color: grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(27),
                ),
              ),
              child: Image.asset(
                'assets/icons8-google-512.png',
                height: 50,
              ),
            ),
            onTap: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
          ),
        ],
      ));
}

// class GoogleSignUpBtn extends StatelessWidget {
//   const GoogleSignUpBtn({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: InkWell(
//           child: Container(
//             height: 60,
//             width: 10,
//             color: grey,
//             child: SizedBox(
//               height: 50,
//               width: 50,
//               child: Image.asset(
//                 'assets/icons8-google-512.png',
//               ),
//             ),
//           ),
//           onTap: () {
//             final provider =
//                 Provider.of<GoogleSignInProvider>(context, listen: false);
//             provider.googleLogin();
//           },
//         ));
//   }
// }
