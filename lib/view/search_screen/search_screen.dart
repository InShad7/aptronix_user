import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/wish_list_screen/widget/wish_list_card.dart';
import 'package:flutter/material.dart';

TextEditingController _searchController = TextEditingController();

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                autofocus: true,
                controller: _searchController,
                cursorColor: blue,
                style: TextStyle(color: blue),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: blue),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: blue),
                    onPressed: () => _searchController.clear(),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(234, 236, 238, 2),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                  hintText: 'Search . . .',
                ),
                onChanged: (value) {
                  title
                      .where((element) => element
                          .toString()
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: img.length,
                itemBuilder: (context, index) => WishListCard(index: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
