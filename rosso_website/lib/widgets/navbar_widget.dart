import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'dart:js' as js;

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    ScreenSize size = ScreenSize();

    return Container(
      //color: Colors.grey[300],
      width: size.col_12(context: context),
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: size.isDesktop(context: context) ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: size.col_3(context: context),
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
          Spacer(),
          size.isDesktop(context: context) ? Container(
            alignment: Alignment.centerRight,
            width: size.col_1(context: context),
            child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: Text(
                    "Início",
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
          ) : Container(),
          size.isDesktop(context: context) ? Container(
            alignment: Alignment.centerRight,
            width: size.col_1(context: context),
            child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: Text(
                    "Sobre Nós",
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
          ) : Container(),
          size.isDesktop(context: context) ? Container(
            alignment: Alignment.centerRight,
            width: size.col_1(context: context),
            child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: Text(
                    "Produtos",
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
          ) : Container(),
          size.isDesktop(context: context) ? Container(
            alignment: Alignment.centerRight,
            width: size.col_1(context: context),
            child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: Text(
                    "Contato",
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
          ) : Container(),
          size.isDesktop(context: context) ? Container(
            width: size.col_1(context: context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
              width: 28,
              height: 28,
              child: InkWell(
                    onTap: () {
                      //Redirecionamento link Facebook
                      js.context.callMethod('open', ['https://facebook.com/agricolavetrosso']);
                    },
                    child: Image.asset("assets/images/facebook.png", fit: BoxFit.contain,),
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
                      js.context.callMethod('open', ['https://www.instagram.com/agricolavetrosso']);
                    },
                    child: Image.asset("assets/images/instagram.png", fit: BoxFit.contain),
                  ),
            ),
              ],
            ),
          ) : Container(),
          SizedBox(
            width: 25,
          )
        ],
      ),
    );
  }
}
