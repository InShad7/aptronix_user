import 'package:aaptronix/view/order_summary_screen/address_screen/widget/title_and_btn.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  
  String? selectedAddress;
  List address = [
    'address 1\nadmin house /Building /appartment\nArea,street,village\nLandmark\npincode\nPhone number',
    'Address 2',
    'Address 3',
    'Address 4'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar( title: 'Address'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          TitleAndBtn(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: address.length,
            itemBuilder: (context, index) {
              return RadioListTile(
                activeColor: blue,
                title: Container(
                  padding: const EdgeInsets.all(15),
                  // margin: const EdgeInsets.only(left: 16, right: 16, top: 5),
                  height: 200,
                  decoration: BoxDecoration(
                    color: cardClr2,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    address[index],
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                value: address[index],
                groupValue: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }

}
