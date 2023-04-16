import 'package:aaptronix/view/utils/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductCurosel extends StatefulWidget {
  ProductCurosel({super.key, this.imgs});
  final imgs;

  @override
  State<ProductCurosel> createState() => _ProductCuroselState();
}

int activeIndex = 0;
// List productImg = [
//   'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-finish-select-202209-6-7inch-product-red?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661027939728',
//   'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-finish-select-202209-6-7inch-product-red_AV1_GEO_EMEA?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661027861748',
//   'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-finish-select-202209-6-7inch-product-red_AV2?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661028274734'
// ];

class _ProductCuroselState extends State<ProductCurosel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: CarouselSlider.builder(
            itemCount: widget.imgs.length,
            itemBuilder: (context, index, realIndex) => Container(
              width: 390,
              // height: 300,
              decoration: BoxDecoration(
                // color: blue,
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    image: NetworkImage(widget.imgs[index]), fit: BoxFit.cover),
              ),
            ),
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
        ),
        kHeight,
        buildIndicators(),
      ],
    );
  }

  Widget buildIndicators() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.imgs.length,
        effect: ExpandingDotsEffect(dotWidth: 10, dotHeight: 10),
      );
}
