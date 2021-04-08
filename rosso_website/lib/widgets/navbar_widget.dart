import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'dart:js' as js;

class Navbar extends StatelessWidget {
  final ScreenSize size = ScreenSize();
  final GlobalKey<ScaffoldState> drawerKey;

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
                // Color.fromRGBO(74, 190, 12, 60),
                // Color.fromRGBO(52, 150, 9, 50)
                Color.fromRGBO(58, 255, 33, 1),
                Color.fromRGBO(32, 171, 16, 1)
              ])),
      //color: Colors.grey[300],
      width: size.col_12(context: context),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: size.isDesktop(context: context)
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.spaceBetween,
        children: [
          size.isDesktop(context: context)
              ? Container()
              : Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: size.col_3(context: context),
                  child: IconButton(
                      onPressed: () {
                        //Abrir drawer
                        drawerKey.currentState!.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu_rounded,
                        color: Colors.green[900],
                      ))),
          Container(
            alignment: size.isDesktop(context: context)
                ? Alignment.centerLeft
                : Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: size.isDesktop(context: context)
                ? size.col_3(context: context)
                : size.col_6(context: context),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.contain,
                //scale: 6,
              ),
            ),
          ),
          //Spacer(),
          size.isDesktop(context: context)
              ? Container(
                  alignment: Alignment.center,
                  width: size.col_1(context: context),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                    child: Text(
                      "Início",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Abadi",//"Tanseek Modern Pro Arabic",
                          fontSize: 17),
                    ),
                  ),
                )
              : Container(),
          size.isDesktop(context: context)
              ? Container(
                  alignment: Alignment.center,
                  width: size.col_2(context: context),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/aboutUs");
                    },
                    child: Text(
                      "Empresa",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Abadi",//"Tanseek Modern Pro Arabic",
                          fontSize: 17),
                    ),
                  ),
                )
              : Container(),
          size.isDesktop(context: context)
              ? Container(
                  alignment: Alignment.center,
                  width: size.col_2(context: context),
                  child: InkWell(
                    onHover: (test) {
                      print("passo a pirola!");
                      Container(
                        height: 25,
                        width: 25,
                        color: Colors.black,
                      );
                    },
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/");
                    },
                    child: Text(
                      "Produtos",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Abadi",//"Tanseek Modern Pro Arabic",
                          fontSize: 17),
                    ),
                  ),
                )
              : Container(),
          size.isDesktop(context: context)
              ? Container(
                  alignment: Alignment.center,
                  width: size.col_1(context: context),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/contact");
                    },
                    child: Text(
                      "Contato",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Abadi",//"Tanseek Modern Pro Arabic",
                          fontSize: 17),
                    ),
                  ),
                )
              : Container(),
          size.isDesktop(context: context)
              ? Container(
                  width: size.col_2(context: context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
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
                        width: 28,
                        height: 28,
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
