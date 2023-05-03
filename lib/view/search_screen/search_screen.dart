import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/home_screen/widget/home_item_card.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';

TextEditingController _searchController = TextEditingController();

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    searchList = myProduct;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    log('controller ${_searchController.text}');
    return Scaffold(
      backgroundColor: white,
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
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        searchList = myProduct;
                        log('controller2 ${_searchController.text}');
                      });
                    },
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(234, 236, 238, 2),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                  hintText: 'Search . . .',
                ),
                onChanged: (value) {
                  log(value);
                  setState(() {
                    searchList = myProduct
                        .where((element) => element['name']
                            .toLowerCase()
                            .replaceAll(RegExp(r"\s+"), "")
                            .replaceAll(RegExp(r"[()]"), "")
                            .contains(value
                                .toLowerCase()
                                .replaceAll(RegExp(r"\s+"), "")))
                        .toList();
                  });

                  log(searchList.length.toString());
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) =>
                    const HomeItemCards(search: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
