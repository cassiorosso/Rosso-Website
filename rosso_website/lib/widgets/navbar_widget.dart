import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/products_controller.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'dart:js' as js;

import 'package:rosso_website/widgets/search_bar_widget.dart';

class Navbar extends StatelessWidget {
  final ScreenSize size = ScreenSize();
  final GlobalKey<ScaffoldState> drawerKey;
  final _productsController = Get.find<ProductsController>();

  Navbar(Key? key, this.drawerKey) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: size.isMobile(context: context) ? 120 : 80,
      child: Row(
        crossAxisAlignment: size.isMobile(context: context) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        mainAxisAlignment: size.isDesktop(context: context)
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.spaceBetween,
        children: [
          size.isDesktop(context: context)
              ? Container()
              : Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: size.col_2(context: context),
                  child: IconButton(
                      onPressed: () {
                        //Abrir drawer
                        drawerKey.currentState!.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu_rounded,
                        size: 34,
                        color: Colors.green[900],
                      ))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: size.isDesktop(context: context)
                    ? Alignment.centerLeft
                    : Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                width: size.isMobile(context: context)
                ? size.col_4(context: context)
                : size.col_2(context: context),
                child: GestureDetector(
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name == "/home")
                      Navigator.popAndPushNamed(context, "/home");
                    else
                      Navigator.pushNamed(context, "/home");
                  },
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                    scale: size.isMobile(context: context) ? 5 : 7,
                  ),
                ),
              ),
              size.isMobile(context: context) ? SizedBox(height: 5,) : Container(),
              size.isMobile(context: context) ? SearchBar(searchAction: _productsController.searchProduct) : Container(),
            ],
          ),
          size.isMobile(context: context) ? Container() : SearchBar(searchAction: _productsController.searchProduct),
          size.isDesktop(context: context)
              ? Container(
                  alignment: Alignment.center,
                  width: size.col_1_5(context: context),
                  child: InkWell(
                    onTap: () {
                      if (ModalRoute.of(context)!.settings.name == "/aboutUs")
                        Navigator.popAndPushNamed(context, "/aboutUs");
                      else
                        Navigator.pushNamed(context, "/aboutUs");
                    },
                    child: Text(
                      "Empresa",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Abadi", //"Tanseek Modern Pro Arabic",
                          fontSize: 22),
                    ),
                  ),
                )
              : Container(),
          size.isDesktop(context: context)
              ? Container(
                  alignment: Alignment.center,
                  width: size.col_1_5(context: context),
                  child: InkWell(
                    onTap: () {
                      if (ModalRoute.of(context)!.settings.name == "/products")
                        Navigator.popAndPushNamed(context, "/products");
                      else
                        Navigator.pushNamed(context, "/products");
                    },
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                      child: Text(
                        "Produtos",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Abadi", //"Tanseek Modern Pro Arabic",
                            fontSize: 22),
                      ),
                    ),
                  ),
                )
              : Container(),
          size.isDesktop(context: context)
              ? Container(
                  alignment: Alignment.center,
                  width: size.col_1_5(context: context),
                  child: InkWell(
                    onTap: () {
                      if (ModalRoute.of(context)!.settings.name == "/contact")
                        Navigator.popAndPushNamed(context, "/contact");
                      else
                        Navigator.pushNamed(context, "/contact");
                    },
                    child: Text(
                      "Contato",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Abadi", //"Tanseek Modern Pro Arabic",
                          fontSize: 22),
                    ),
                  ),
                )
              : Container(),
          size.isDesktop(context: context)
              ? Container(
                  //color: Colors.white,
                  width: size.col_1_5(context: context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        child: InkWell(
                          onTap: () {
                            //Redirecionamento link Facebook
                            js.context.callMethod('open',
                                ['https://facebook.com/agricolavetrosso']);
                          },
                          child: Image.asset(
                            "assets/images/facebook.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        child: InkWell(
                          onTap: () {
                            //Redirecionamento link Instagram
                            js.context.callMethod('open',
                                ['https://www.instagram.com/agricolavetrosso']);
                          },
                          child: Image.asset("assets/images/instagram.png",
                              fit: BoxFit.contain),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          SizedBox(
            width: 25,
          )
        ],
      ),
    );
  }
}
