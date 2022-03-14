import 'package:flutter/material.dart';
import 'package:rosso_website/widgets/homeBanner_widget.dart';
import 'package:rosso_website/widgets/messageUs_widget.dart';
import 'package:rosso_website/widgets/ourWork_widget.dart';

import 'package:rosso_website/widgets/previewAbout_widget.dart';
import 'package:rosso_website/widgets/spotlight_products.dart';
import 'package:rosso_website/widgets/title_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeBanner(),
        TittleWidget(title: "PRODUTOS DESTAQUE"),
        SpotLightProducts(),
        SizedBox(
          height: 30,
        ),
        TittleWidget(title: "QUEM SOMOS"),
        PreviewAbout(),
        TittleWidget(title: "NOSSO TRABALHO"),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            OurWork(null, "assets/images/comercio.jpg", "Comércio de Produtos",
                "São mais de 6000 itens disponíveis a pronta-entrega nos departamentos de pet, pesca e camping, utilidades e ferragens, jardinagem e muito mais! Conheça nossa loja e desfrute de um atendimento personalizado para a sua necessidade."),
            OurWork(
                null,
                "assets/images/veterinario.jpg",
                "Consultório e Laboratório Veterinário",
                "Possuimos uma clínica veterinária para cães, gatos, pássaros e animais silvestres. Nossos veterinários realizam procedimentos como consultas, vacinas, castrações e exames. Agende um horário!"),
            OurWork(
                null,
                "assets/images/hortifruti.jpg",
                "Assistência Técnica Agrônomica",
                "Contamos com uma equipe especializada para auxiliar o produtor em diversos tipos de cultura como hortifruti, soja, milho e muito mais, fornecendo um atendimento personalizado focado em produtividade e resultado."),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        MessageUsWidget(),
      ],
    );
  }
}
