import 'package:aaptronix/view/category_screen/widget/category_filter_chip.dart';
import 'package:aaptronix/view/category_screen/widget/item_card.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';

import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavScreenAppBar(title: 'Category'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children:const [
           MyFilterChip(),
          ItemCards(),
        ],
      ),
    );
  }
}

//  final filteredList = data
//                                   .where(
//                                     (item) => 'iPhone' == item['category'],
//                                   )
//                                   .toList();