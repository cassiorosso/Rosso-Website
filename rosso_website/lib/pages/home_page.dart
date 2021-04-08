import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/bottom_widget.dart';
import 'package:rosso_website/widgets/contact_widget.dart';
import 'package:rosso_website/widgets/floatingActionButtonWhatsapp.dart';
import 'package:rosso_website/widgets/googleMap_widget.dart';
import 'package:rosso_website/widgets/homeBanner_widget.dart';
import 'package:rosso_website/widgets/menuDrawer_widget.dart';
import 'package:rosso_website/widgets/messageUs_widget.dart';
import 'package:rosso_website/widgets/navbar_widget.dart';
import 'package:rosso_website/widgets/ourWork_widget.dart';

import 'package:rosso_website/widgets/previewAbout_widget.dart';
import 'package:rosso_website/widgets/title_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenSize size = ScreenSize();
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    return Scaffold(
      key: _drawerKey,
      drawer: size.isDesktop(context: context) ? null : MenuDrawer(),
      floatingActionButton: FloatingActionButtonWhatsapp(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background.jpg"), fit: BoxFit.fill)
        ),
        width: size.totalWidth(context: context),
        child: Scrollbar(
          isAlwaysShown: true,
          showTrackOnHover: true,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Navbar(null,_drawerKey),
              HomeBanner(),
              TittleWidget(title: "QUEM SOMOS"),
              PreviewAbout(),
              TittleWidget(title: "NOSSO TRABALHO"),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  OurWork(
                      null,
                      "/images/comercio.jpg",
                      "Comércio de Produtos",
                      "São mais de 6000 itens disponíveis a pronta entrega nos departamentos de pet, pesca e camping, utilidades e ferragens, jardinagem e muito mais em nossa loja com mais de 250m². Conheça nossa loja e desfrute de um atendimento personalizado para a sua necessidade."),
                  OurWork(
                      null,
                      "/images/veterinario.jpg",
                      "Consultório e Laboratório Veterinário",
                      "Possuimos uma clínica veterinária para cães, gatos, pássaros e animais silvestres. Nossos veterinários realizam procedimentos como consultas, vacinas, castrações e exames. Agende um horário!"),
                  OurWork(
                      null,
                      "/images/hortifruti.jpg",
                      "Assistência Técnica Agrônomica",
                      "Contamos com um engenheiro agrônomo para auxiliar o produtor em diversos tipos de cultura como hortifruti, soja, milho e muito mais, fornecendo um atendimento personalizado focado em produtividade e resultado."),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              MessageUsWidget(),
              TittleWidget(title: "CONTATO"),
              ContactWidget(),
              LocationMap(),
              Bottom(),
            ],
          )),
        ),
      ),
    );
  }
}
