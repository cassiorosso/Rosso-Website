import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rosso_website/utils/scree_size.dart';

class HomeBanner extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          disableCenter: true,
          //height: 600,
          autoPlay: true,
        ),
        items: [
          // Container(
          //   width: 1080,
          //   height: 800,
          //   color: Colors.blueAccent,
          // ),
          Container(
            width: size.col_12(context: context),
            child: Image.asset("/images/teste.jpg", fit: BoxFit.cover/*BoxFit.fitHeight*/,),
          ),
        ],
      ),
    );
  }
}
