import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';

class ContactWidget extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: size.col_12(context: context),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          Container(
            width: size.isDesktop(context: context)
                ? size.col_3(context: context)
                : size.col_12(context: context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.green[800],
                  size: 48,
                ),
                SizedBox(height: 10,),
                SelectableText("Endereço", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(height: 5,),
                SelectableText("Av. Presidente Vargas, 2731, São Cristóvão, 99064-000, Passo Fundo - RS, Brasil",textAlign: TextAlign.center, style: TextStyle(fontSize: 17, letterSpacing: 1)),
                SizedBox(height: 15,),
              ],
            ),
          ),
          Container(
            width: size.isDesktop(context: context)
                ? size.col_3(context: context)
                : size.col_12(context: context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.green[800],
                  size: 48,
                ),
                SizedBox(height: 10,),
                SelectableText("Telefone", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(height: 5,),
                SelectableText("(54) 3315-1544\n(54) 99141-3355", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, letterSpacing: 1), ),
                SizedBox(height: 15,),
              ],
            ),
          ),
          Container(
            width: size.isDesktop(context: context)
                ? size.col_3(context: context)
                : size.col_12(context: context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  color: Colors.green[800],
                  size: 48,
                ),
                SizedBox(height: 10,),
                Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(height: 5,),
                SelectableText("contato@agricolavetrosso.com.br", style: TextStyle(fontSize: 17, letterSpacing: 1)),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
