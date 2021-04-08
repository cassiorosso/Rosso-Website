import 'package:flutter/material.dart';

class TittleWidget extends StatelessWidget {
  final String title;

  const TittleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Montserrat" , letterSpacing: 1),),
    );
  }
}
