import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? selectedItem;

class DropDownList extends StatefulWidget {
  const DropDownList({super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          kHeight5,
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              color: cardClr,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton(
                  value: selectedItem,
                  isExpanded: true,
                  underline: null,
                  hint: const Text('Select'),
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(fontSize: 19, color: black),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Black',
                      child: Text('Black'),
                    ),
                    DropdownMenuItem(
                      value: 'Product Red',
                      child: Text('Product Red'),
                    ),
                    DropdownMenuItem(
                      value: 'Deep Purple',
                      child: Text('Deep Purple'),
                    ),
                    DropdownMenuItem(
                      value: 'Silver',
                      child: Text('Silver'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

String? selectedItem2;

class DropDownList2 extends StatefulWidget {
  const DropDownList2({super.key});

  @override
  State<DropDownList2> createState() => _DropDownList2State();
}

class _DropDownList2State extends State<DropDownList2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          kHeight5,
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              color: cardClr,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton(
                  value: selectedItem2,
                  isExpanded: true,
                  underline: null,
                  hint: const Text('Select'),
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(fontSize: 19, color: black),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: '128 GB',
                      child: Text('128 GB'),
                    ),
                    DropdownMenuItem(
                      value: '256 GB',
                      child: Text('256 GB'),
                    ),
                    DropdownMenuItem(
                      value: '512 GB',
                      child: Text('512 GB'),
                    ),
                    // DropdownMenuItem(
                    //   value: 'Silver',
                    //   child: Text('Silver'),
                    // ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedItem2 = value;
                    });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
