import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rosso_website/utils/scree_size.dart';

class HomeBanner extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.col_12(context: context),
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1920/768, // Resolution 1920 x 768
          viewportFraction: 1,
          autoPlay: true,
        ),
        items: [
          Image.asset("/images/banner1.png",),
          Image.asset("/images/banner2.png",),
          Image.asset("/images/banner3.png",),
          Image.asset("/images/banner4.png",),
        ],
      ),
    );
  }
}
