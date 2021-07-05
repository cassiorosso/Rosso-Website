import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/messageUs_widget.dart';
import 'package:rosso_website/widgets/title_widget.dart';

class ContactPage extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TittleWidget(title: "CONTATO"),
        Container(
          width: size.col_12(context: context),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                width: size.isDesktop(context: context)
                    ? size.col_5(context: context)
                    : size.col_10(context: context),
                child: Image.asset("assets/images/loja1.jpg"),
              ),
              SizedBox(
                width: size.isDesktop(context: context)
                    ? 20
                    : size.col_8(context: context),
                height: 20,
              ),
              Container(
                width: size.isDesktop(context: context)
                    ? size.col_5(context: context)
                    : size.col_8(context: context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: "ENDEREÇO\n",
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "Av. Presidente Vargas, 2731\nCEP: 99064-000 - São Cristóvão\nPasso Fundo/RS-Brasil",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              TextSpan(
                                text: "\n\nHORÁRIOS DE ATENDIMENTO\n",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text:
                                      "Segunda à Sexta 7:30 - 12:00 | 13:30 - 18:30\nSábado 7:30 - 16:00",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              TextSpan(
                                text: "\n\nTELEFONE\n",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: "(54) 3315-1544\n(54) 99141-3355",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                            ])),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        MessageUsWidget(),
      ],
    );
  }
}
