import 'dart:developer';

import 'package:aaptronix/view/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  const customCurosel({super.key, this.imgs});
  final imgs;

  @override
  State<customCurosel> createState() => _customCuroselState();
}

class _customCuroselState extends State<customCurosel> {
  @override
  Widget build(BuildContext context) {
    log('cursel rebuilded');
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imgs.length,
          itemBuilder: (context, index, realIndex) {
            final urlImg = widget.imgs[index];
            return buildImage(urlImg, index);
          },
          options: CarouselOptions(
            viewportFraction: 0.92,
            height: 220,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
        kHeight,
        buildIndicators(widget.imgs.length),
      ],
    );
  }

  Widget buildImage(String imgUrl, int index) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        child: CachedNetworkImage(
          placeholder: (context, url) => Image.asset('assets/APPRONIX.jpg'),
          imageUrl: imgUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
        ),
      );

  Widget buildIndicators([length]) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: length,
        effect: WormEffect(dotWidth: 10, dotHeight: 10),
      );
}
