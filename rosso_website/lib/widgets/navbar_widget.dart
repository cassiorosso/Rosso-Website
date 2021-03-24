import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rosso_website/utils/scree_size.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    ScreenSize size = ScreenSize();

    return Container(
      color: Colors.grey[300],
      width: size.col_12(context: context),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: size.col_5(context: context),
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
          Container(
            width: size.col_2(context: context),
            child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: Text(
                    "Início",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
          ),
          Container(
            width: size.col_2(context: context),
            child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: Text(
                    "Início",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
          ),
          Container(
            width: size.col_2(context: context),
            child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: Text(
                    "Início",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
