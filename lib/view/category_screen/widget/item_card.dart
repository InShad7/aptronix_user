// import 'package:aaptronix/controller/controller.dart';
// import 'package:aaptronix/view/home_screen/product_details/product_details.dart';
// import 'package:aaptronix/view/home_screen/widget/fav_icon.dart';
// import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
// import 'package:aaptronix/view/utils/colors.dart';
// import 'package:aaptronix/view/utils/utils.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ItemCards extends StatelessWidget {
//   ItemCards({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           kHeight,
//           GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//                 childAspectRatio: (mHeight! > 925) ? 0.74 : 0.63,
//               ),
//               itemCount: categoryList.length,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 final product = categoryList[index];
//                 return Container(
//                   decoration: BoxDecoration(
//                       color: white,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: grey)),
//                   child: Column(children: [
//                     InkWell(
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 12),
//                         height: mHeight! / 6,
//                         width: mHeight! / 6,
//                         decoration: BoxDecoration(
//                           // color: white,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: CachedNetworkImage(
//                           placeholder: (context, url) => Image.asset(
//                               'assets/APPRONIX.jpg'), // Add whatever you want to display.
//                           imageUrl: product['images'][0],
//                         ),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 ProductDetailsScreen(product: product),
//                           ),
//                         );
//                       },
//                     ),
//                     const Spacer(),
//                     Container(
//                        height: mHeight! / 12,
//                       width: 170,
//                       decoration: BoxDecoration(
//                         color: white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 8, right: 8),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             kHeight,
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Flexible(
//                                   child: InkWell(
//                                     child: Text(
//                                       product['name'],
//                                       overflow: TextOverflow.ellipsis,
//                                       style: GoogleFonts.roboto(
//                                         textStyle: const TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               ProductDetailsScreen(
//                                                   product: product),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 kWidth,
//                                 kWidth5,
//                                 FavIcon(product: product['id'])
//                               ],
//                             ),
//                             InkWell(
//                               child: Text(
//                                 '₹ ${product['price']}',
//                                 style: GoogleFonts.roboto(
//                                   textStyle: const TextStyle(fontSize: 18),
//                                 ),
//                               ),
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         ProductDetailsScreen(product: product),
//                                   ),
//                                 );
//                               },
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ]),
//                 );
//                 // : null;
//               })
//         ],
//       ),
//     );
//   }
// }
