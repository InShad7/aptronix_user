// import 'package:aaptronix/controller/controller.dart';
// import 'package:aaptronix/model/wish_list_model.dart';
// import 'package:aaptronix/view/utils/colors.dart';
// import 'package:aaptronix/view/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class WishListCard extends StatefulWidget {
//   const WishListCard({super.key, required this.product});
//   final product;

//   @override
//   State<WishListCard> createState() => _WishListCardState();
// }

// class _WishListCardState extends State<WishListCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
//       child: Container(
//         height: 110,
//         decoration: BoxDecoration(
//           color: cardClr,
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Container(
//                 height: 90,
//                 width: 80,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: white,
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       widget.product['images'][0],
//                     ),
//                   ),
//                 ),
//               ),
//               kWidth15,
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 230,
//                     child: Text(
//                       widget.product['name'],
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: GoogleFonts.roboto(
//                         textStyle: const TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         '${widget.product['size'].toString()} GB',
//                         style: GoogleFonts.roboto(
//                             textStyle: const TextStyle(fontSize: 17)),
//                       ),
//                       // const Spacer(),
//                       // FavIcon()
//                     ],
//                   ),
//                   Text(
//                     '₹ ${widget.product['price'].toString()}',
//                     style: GoogleFonts.roboto(
//                       textStyle: const TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     myWishList.remove(widget.product['id']);

//                   WishList myWishobj = WishList(wishList: myWishList);
//                   myWishobj.addToWishList();
//                   getWishList();
                    
//                   });
                  
//                 },
//                 icon: Icon(
//                   Icons.favorite,
//                   color: red,
//                 ),
//               ),
//               // kWidth,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
