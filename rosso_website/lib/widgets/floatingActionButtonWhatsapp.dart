import 'package:flutter/material.dart';
import 'dart:js' as js;


class FloatingActionButtonWhatsapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      onPressed: () {
        js.context.callMethod('open', ['https://web.whatsapp.com/send?phone=5554991413355&text=Ol%C3%A1!']);
      },
      child: Image.asset("assets/images/whatsapp.png"),
      );
  }
}
