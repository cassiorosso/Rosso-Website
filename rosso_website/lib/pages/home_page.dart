import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/navbar_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSize size = ScreenSize();

    return Scaffold(
      drawer: size.isDesktopXl(context: context) ? null : Drawer(),
      body: Container(
        width: size.totalWidth(context: context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Navbar()
            ],
          ),
        ),
      ),  
    );
  }
}
