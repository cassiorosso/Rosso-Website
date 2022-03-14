import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer.dart';

class OurWork extends StatelessWidget {
  final ScreenSize size = ScreenSize();
  final String pathImage;
  final String title;
  final String text;

  OurWork(Key? key, this.pathImage, this.title, this.text) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      width: size.isMobile(context: context) ? size.col_12(context: context) : size.isTablet(context: context) ? size.col_5(context: context) : size.col_4(context: context),
      child: Column(
        children: [
          Container(
            child: Image.asset(
              pathImage,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20,),
          SelectableText(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          TextRenderer(
            element: ParagraphElement(),
            text: SelectableText(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 1.4)
            ),
          ),
        ],
      ),
    );
  }
}
