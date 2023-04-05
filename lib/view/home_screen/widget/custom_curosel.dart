import 'package:aaptronix/view/utils/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final imgUrl = [
  'https://beebom.com/wp-content/uploads/2022/02/iphone-14-cover-banner-2.jpg?w=1920',
  'https://cdn.sforum.vn/sforum/wp-content/uploads/2020/05/maxresdefault.jpg',
  'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/ee39b5127626079.61459b4a17a3b.png',
  'https://i0.wp.com/store.ave.com.bn/wp-content/uploads/2022/03/iPad_Air_Web_Banner_Avail_1400x700__SEA_FFH.png?fit=1400%2C700&ssl=1',
];

int activeIndex = 0;

class customCurosel extends StatefulWidget {
  const customCurosel({super.key});

  @override
  State<customCurosel> createState() => _customCuroselState();
}

class _customCuroselState extends State<customCurosel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imgUrl.length,
          itemBuilder: (context, index, realIndex) {
            final urlImg = imgUrl[index];
            return buildImage(urlImg, index);
          },
          options: CarouselOptions(
            viewportFraction: 0.95,
            height: 220,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
        kHeight,
        buildIndicators(),
      ],
    );
  }

  Widget buildImage(String imgUrl, int index) => Container(
        width: double.infinity,
        // margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.grey,
          image:
              DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
        ),
      );

  Widget buildIndicators() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imgUrl.length,
        effect: WormEffect(dotWidth: 10, dotHeight: 10),
      );
}
