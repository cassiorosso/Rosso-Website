import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';

class PreviewAbout extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(image: AssetImage("assets/images/background.jpg"), fit: BoxFit.cover,)
      // ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      width: size.col_12(context: context),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          //color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: size.isDesktop(context: context) ? size.col_2(context: context) : size.col_6(context: context),
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.contain,
            //scale: 6,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          //color: Colors.transparent,
          width: size.isDesktop(context: context) ? size.col_7(context: context) : size.col_10(context: context),
          child: Text(
            "A Agrícola Veterinária Rosso atua por mais de 30 anos no comércio de Passo Fundo, sendo referência na região com uma loja de mais de 250m², atuando nos departamentos agrícola, veterinário, pet, pesca, camping, ferragens, utilidades, insumos, rações e medicamentos.",
            textAlign: TextAlign.center,
            style: TextStyle(
                letterSpacing: 0.5,
                fontSize: 18,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 2, primary: Colors.green[700], onPrimary: Colors.white),
            onPressed: () => Navigator.pushNamed(context, "/aboutUs"),
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                "Conheça nossa história",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
      ],
        ),
    );
  }
}
