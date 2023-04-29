import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/home_screen/widget/custom_curosel.dart';
import 'package:aaptronix/view/home_screen/widget/home_item_card.dart';
import 'package:aaptronix/view/search_screen/search_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getWishList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'aptronix.',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 32, color: black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.search_rounded,
                color: black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: homeCurosel(),
    );
  }

  Widget homeCurosel() {
    return StreamBuilder(
        stream: GetImages(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SizedBox(
              height: 50,
              width: 50,
              child: LoadingIndicator(
                indicatorType: Indicator.circleStrokeSpin,
                colors: [blue],
                strokeWidth: 1,
              ),
            ));
          }
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return snapshot.data!.isEmpty
                  ? const Center(child: Text('List empty'))
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        kHeight20,
                        customCurosel(imgs: data[0]['images']),
                        kHeight20,
                        const CategoryItemCard(),
                        kHeight5,
                        const HomeItemCards(),
                      ],
                    );
            }
          }
          return Text('Cant fetch data');
        });
  }
}

Future checkWishList() async {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set({
    'wishlist': ['no']
  });
}
