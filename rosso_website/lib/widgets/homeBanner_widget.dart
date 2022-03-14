import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/home_controller.dart';
import 'package:rosso_website/models/banner_model.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeBanner extends StatelessWidget {
  final ScreenSize size = ScreenSize();
  final _controller = Get.find<HomeController>();
  final CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: size.col_12(context: context),
        child: Obx(() {
          List<BannerModel> bannerList = [];
          if (size.isMobile(context: context)) {
            bannerList.assignAll(_controller.banners
                .where((ban) => ban.isMobile == true)
                .toList());
          } else {
            bannerList.assignAll(_controller.banners
                .where((ban) => ban.isMobile == false)
                .toList());
          }
          return CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
                aspectRatio:
                    size.isMobile(context: context) ? 1080 / 1080 : 1920 / 600,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 7),
                autoPlayAnimationDuration: Duration(seconds: 3)),
            items: _controller.banners.isEmpty
                ? [
                    Container(
                        height: 50,
                        width: 50,)
                  ]
                : bannerList
                    .map((element) => FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: element.url))
                    .toList(),
          );
        }),
      ),
      Positioned(
          right: 10,
          top: 180,
          child: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.red[700],
            ),
            iconSize: 45,
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
            iconSize: 45,
            onPressed: () {
              buttonCarouselController.previousPage();
            },
          ))
    ]);
  }
}
