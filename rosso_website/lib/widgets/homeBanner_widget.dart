import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rosso_website/utils/scree_size.dart';

class HomeBanner extends StatelessWidget {
  final ScreenSize size = ScreenSize();
  final CarouselController buttonCarouselController =
                  CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        width: size.col_12(context: context),
        child: CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            aspectRatio: size.isMobile(context: context) ? 1080/1080 : 1920/600,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 7),
            autoPlayAnimationDuration: Duration(seconds: 3)
          ),
          items: [
            size.isMobile(context: context) ? Image.asset("assets/images/banner1_mobile.png") : Image.asset("assets/images/banner1.png",),
            size.isMobile(context: context) ? Image.asset("assets/images/banner2_mobile.png") : Image.asset("assets/images/banner2.png",),
            size.isMobile(context: context) ? Image.asset("assets/images/banner3_mobile.png") : Image.asset("assets/images/banner3.png",),
            size.isMobile(context: context) ? Image.asset("assets/images/banner4_mobile.png") : Image.asset("assets/images/banner4.png",),
          ],
        ),
      ),
      Positioned(
                        right: 10,
                        top: 180,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.red[700],
                          ),
                          iconSize: 40,
                          onPressed: () {
                            buttonCarouselController.nextPage();
                          },
                        )),
                        Positioned(
                        left: 10,
                        top: 180,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.red[700],
                          ),
                          iconSize: 40,
                          onPressed: () {
                            buttonCarouselController.previousPage();
                          },
                        ))
      ]
    );
  }
}
