import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';

class Bottom extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: size.col_12(context: context),
      color: Colors.indigo,
      child: SelectableText(
        "© 2022 - Agrícola Veterinária Rosso LTDA | CNPJ 92.043.264/0001-40 | Desenvolvido por Cássio Rosso",
        style: TextStyle(color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.w300, fontFamily: "Didact Gothic"),
        textAlign: TextAlign.center,
      ),
    );
  }
}
