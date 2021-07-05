import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/bottom_widget.dart';
import 'package:rosso_website/widgets/contact_widget.dart';
import 'package:rosso_website/widgets/floatingActionButtonWhatsapp.dart';
import 'package:rosso_website/widgets/googleMap_widget.dart';
import 'package:rosso_website/widgets/menuDrawer_widget.dart';
import 'package:rosso_website/widgets/navbar_widget.dart';
import 'package:rosso_website/widgets/title_widget.dart';

class BasePage extends StatelessWidget {
  final Widget widget;
  BasePage({Key? key, required this.widget}) : super(key: key);
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final size = ScreenSize();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtonWhatsapp(),
      key: _drawerKey,
      drawer: size.isDesktop(context: context) ? null : MenuDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.fill)),
            width: size.totalWidth(context: context),
            child: Scrollbar(
              controller: _scrollController,
              isAlwaysShown: true,
              showTrackOnHover: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.isMobile(context: context) ? 110 : 70,
                    ), //Altura da Navbar
                    widget,
                    SizedBox(
                      height: 70,
                    ),
                    TittleWidget(title: "Contato"),
                    ContactWidget(),
                    LocationMap(context),
                    Bottom(),
                  ],
                ),
              ),
            ),
          ),
          Navbar(null, _drawerKey),
        ],
      ),
    );
  }
}
