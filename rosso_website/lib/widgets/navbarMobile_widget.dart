import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/products_controller.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/search_bar_widget.dart';

class NavbarMobile extends StatelessWidget {
  final ScreenSize size = ScreenSize();
  final GlobalKey<ScaffoldState> drawerKey;
  final _productsController = Get.find<ProductsController>();

  NavbarMobile({Key? key, required this.drawerKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0, 0.45],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(58, 255, 33, 1),
                  Color.fromRGBO(32, 171, 16, 1)
                ])),
        width: size.col_12(context: context),
        height: 52,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 10),
                width: size.col_2(context: context),
                child: IconButton(
                    onPressed: () {
                      //Abrir drawer
                      drawerKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu_rounded,
                      size: 35,
                      color: Colors.green[900],
                    ))),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              width: size.col_5(context: context),
              child: GestureDetector(
                onTap: () {
                  if (ModalRoute.of(context)!.settings.name == "/inicio")
                    Navigator.popAndPushNamed(context, "/inicio");
                  else
                    Navigator.pushNamed(context, "/inicio");
                },
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                  scale: 1,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: size.col_2(context: context),
            )
          ],
        ),
      ),
      Container(
        width: size.totalWidth(context: context),
        height: 48,
        color: Colors.white,
        child: SearchBar(searchAction: _productsController.searchProduct),
      )
    ]);
  }
}
