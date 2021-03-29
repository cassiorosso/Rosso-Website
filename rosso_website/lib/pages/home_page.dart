import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/contact_widget.dart';
import 'package:rosso_website/widgets/floatingActionButtonWhatsapp.dart';
import 'package:rosso_website/widgets/googleMap_widget.dart';
import 'package:rosso_website/widgets/homeBanner_widget.dart';
import 'package:rosso_website/widgets/menuDrawer_widget.dart';
import 'package:rosso_website/widgets/messageUs_widget.dart';
import 'package:rosso_website/widgets/navbar_widget.dart';
import 'package:rosso_website/widgets/ourWork_widget.dart';
import 'dart:html';

import 'package:rosso_website/widgets/previewAbout_widget.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSize size = ScreenSize();

    return Scaffold(
      drawer: size.isDesktop(context: context) ? null : MenuDrawer(),
      floatingActionButton: FloatingActionButtonWhatsapp(),
      body: Container(
        width: size.totalWidth(context: context),
        child: Scrollbar(
          isAlwaysShown: true,
          showTrackOnHover: true,
                  child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Navbar(),
                  HomeBanner(),
                  PreviewAbout(),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      "Nosso trabalho",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      OurWork(null, "/images/teste2.jpg", "Comério de Produtos",
                          "São mais de 6000 itens disponíveis a pronta entrega nos departamentos de pet, pesca e camping, utilidades e ferragens, jardinagem e muito mais em nossa loja com mais de 250m²"),
                      OurWork(null, "/images/teste2.jpg", "Consultório Veterinário",
                          "São mais de 6000 itens disponíveis a pronta entrega nos departamentos de pet, pesca e camping, utilidades e ferragens, jardinagem e muito mais em nossa loja com mais de 250m²"),
                      OurWork(
                          null,
                          "/images/teste2.jpg",
                          "Assistência em lavouras e hortifruti",
                          "São mais de 6000 itens disponíveis a pronta entrega nos departamentos de pet, pesca e camping, utilidades e ferragens, jardinagem e muito mais em nossa loja com mais de 250m²"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MessageUsWidget(),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Contato", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                  SizedBox(
                    height: 10,
                  ),
                  ContactWidget(),
                  LocationMap(),
                ],
              )),
        ),
      ),
    );
  }
}


