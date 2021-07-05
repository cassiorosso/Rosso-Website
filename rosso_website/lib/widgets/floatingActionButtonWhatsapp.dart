import 'package:flutter/material.dart';
import 'dart:js' as js;


class FloatingActionButtonWhatsapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      onPressed: () {
        js.context.callMethod('open', ['https://api.whatsapp.com/send?phone=5554991413355&text=Ol%C3%A1%2C%20vim%20atrav%C3%A9s%20do%20site!']);
      },
      child: Image.asset("assets/images/whatsapp.png"),
      );
  }
}
