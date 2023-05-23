import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// double? mHeight;
// double? mWidth;

class GetStartedScreen extends StatefulWidget {
  GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    // mHeight = MediaQuery.of(context).size.height;
    // mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: liquidController,
            onPageChangeCallback: (index) {
              setState(() {});
            },
            pages: [
              Container(
                color: white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/iphone14--removebg-preview.png')
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 165, 172, 225),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('assets/ipad--removebg-preview.png')],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 236, 192, 189),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('assets/mac-removebg-preview.png')],
                ),
              )
              // Container(
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 246, 246, 246),
              //       image: DecorationImage(
              //           image: NetworkImage(
              //               'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-pro-model-unselect-gallery-2-202209_GEO_EMEA?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660753617539'))),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 250, 250, 250),
              //       image: DecorationImage(
              //           image: NetworkImage(
              //               'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp14-spacegray-select-202301?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1671304673229'))),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 250, 250, 250),
              //       image: DecorationImage(
              //           image: NetworkImage(
              //               'https://itechstore.co.in/wp-content/uploads/2021/05/IN_r1443_WiFI_PDP_Image_Position-2_Space_Grey.jpg'))),
              // ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 32,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    liquidController.jumpToPage(page: 2);
                  },
                  child: Text(
                    'skip',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: liquidController.currentPage,
                  count: 3,
                  effect: WormEffect(
                    spacing: 16,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.black,
                  ),
                  onDotClicked: (index) {
                    liquidController.animateToPage(page: index);
                  },
                ),
                TextButton(
                  onPressed: () {
                    final page = liquidController.currentPage + 1;
                    liquidController.animateToPage(
                        page: page > 3 ? 0 : page, duration: 400);
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
