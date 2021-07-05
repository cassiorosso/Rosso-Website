import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/products_controller.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/product_tile_spotlight.dart';

class SpotLightProducts extends StatelessWidget {
  final size = ScreenSize();
  final _controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    if (_controller.spottedProducts.isEmpty) _controller.getSpotLightProducts();
    return Column(
      children: [
        Container(
          width: size.col_12(context: context),
          child: Obx(
            () => CarouselSlider(
                options: CarouselOptions(
                  height: 450,
                  viewportFraction: size.isMobile(context: context) ? 0.6: 0.35,
                  autoPlay: false,
                ),
                items: _controller.productStatus == Status.LOADING
                    ? [
                        Center(
                          child: Container(
                            child: CircularProgressIndicator()
                          ),
                        )
                      ]
                    : _controller.productStatus == Status.SUCCESS
                        ? _controller.spottedProducts.isEmpty ?  [
                            Center(
                              child: Container(
                                child: Text(
                                  "Nenhum produto encontrado!",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ] : _controller.spottedProducts
                            .map((produto) => ProductTileSpotLight(product: produto))
                            .toList()
                        : [
                            Center(
                              child: Container(
                                child: Text(
                                  _controller.response.error,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ]),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 2,
                primary: Colors.green[700],
                onPrimary: Colors.white),
            onPressed: () => Navigator.pushNamed(context, "/products"),
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                "Ver todos os Produtos",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
      ],
    );
  }
}
