import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/category_screen/widget/item_card.dart';
import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = -1;
  @override
  void initState() {
    selectedIndex = indx;
    getList(indx);

    super.initState();
  }

  bool selected = false;
  final List<ItemModel> _chipsList = [
    ItemModel("iPhone", cardClr2, false),
    ItemModel("iPad", cardClr2, false),
    ItemModel("Macbook", cardClr2, false),
    ItemModel("iWatch", cardClr2, false),
  ];
  void getList(int selectedIndex) {
    setState(() {
      switch (selectedIndex) {
        case 0:
          categoryList = iphoneList;

          break;
        case 1:
          categoryList = ipadList;

          break;
        case 2:
          categoryList = macList;

          break;
        case 3:
          categoryList = watchList;

          break;
        default:
          categoryList = myProduct;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavScreenAppBar(title: 'Category'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Wrap(
                    spacing: 20,
                    direction: Axis.horizontal,
                    children: filterChipsList(getList),
                  ),
                ],
              ),
            ),
          ),
          ItemCards(),
        ],
      ),
    );
  }

  List<Widget> filterChipsList(getList) {
    List<Widget> chips = [];

    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          padding: const EdgeInsets.all(8),
          selectedColor: blue,
          checkmarkColor: white,
          label: Text(_chipsList[i].label),
          labelStyle: _chipsList[i].isSelected
              ? TextStyle(color: white, fontSize: 16)
              : TextStyle(color: grey1, fontSize: 16),
          backgroundColor: _chipsList[i].color,
          selected: i == selectedIndex,
          onSelected: (bool value) {
            // Fluttertoast.showToast(msg: selectedIndex.toString());
            log('chip ${i.toString()} selected: $value');
            if (value) {
              selectedIndex = i;
              _chipsList.forEach((item) => item.isSelected = false);
              _chipsList[selectedIndex].isSelected = true;
            } else {
              selectedIndex = -1;
              _chipsList[i].isSelected = false;
            }
            // Fluttertoast.showToast(msg: selectedIndex.toString());
            setState(() {
              getList(selectedIndex);
            });
          },
        ),
      );

      chips.add(item);
    }
    return chips;
  }

  onChipStateChangedEvent(int index) {}
}
