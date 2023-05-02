// import 'dart:developer';

// import 'package:aaptronix/view/utils/colors.dart';
// import 'package:aaptronix/view/utils/utils.dart';
// import 'package:flutter/material.dart';

// class MyFilterChip extends StatefulWidget {
//   const MyFilterChip({Key? key, this.getList}) : super(key: key);

//   final getList;
//   @override
//   MyFilterChipState createState() {
//     return MyFilterChipState();
//   }
// }

// class MyFilterChipState extends State<MyFilterChip> {
//   int selectedIndex = -1;
//   bool selected = false;
//   final List<ItemModel> _chipsList = [
//     ItemModel("iPhone", cardClr2, false),
//     ItemModel("iPad", cardClr2, false),
//     ItemModel("Macbook", cardClr2, false),
//     ItemModel("iWatch", cardClr2, false),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0),
//       child: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Wrap(
//               spacing: 20,
//               direction: Axis.horizontal,
//               children: filterChipsList(widget.getList),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<Widget> filterChipsList(getList) {
//     List<Widget> chips = [];
//     // log(chips.toString());
//     for (int i = 0; i < _chipsList.length; i++) {
//       Widget item = Padding(
//         padding: const EdgeInsets.only(left: 10, right: 5),
//         child: FilterChip(
//           padding: const EdgeInsets.all(8),
//           selectedColor: blue,
//           checkmarkColor: white,
//           label: Text(_chipsList[i].label),
//           labelStyle: _chipsList[i].isSelected
//               ? TextStyle(color: white, fontSize: 16)
//               : TextStyle(color: grey1, fontSize: 16),
//           backgroundColor: _chipsList[i].color,
//           selected: _chipsList[i].isSelected,
//           onSelected: (bool value) {
//             log('chip ${i.toString()} selected: $value');
//             if (value) {
//               selectedIndex = i;
//               _chipsList.forEach((item) => item.isSelected = false);
//               _chipsList[selectedIndex].isSelected = true;
//             } else {
//               selectedIndex = -1;
//               _chipsList[i].isSelected = false;
//             }
//             setState(() {
//               getList(selectedIndex);
//             });
//           },
//         ),
//       );
//       chips.add(item);
//     }
//     return chips;
//   }
// }
