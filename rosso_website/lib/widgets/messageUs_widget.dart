import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/facebookPage_widget.dart';

class MessageUsWidget extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: size.col_12(context: context),
      color: Colors.green[700],
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          Container(
            width: size.isDesktop(context: context)
                ? size.col_5(context: context)
                : size.col_12(context: context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Entre em contato",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 430,
                  height: 350,
                  child: FacebookPage(),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Container(
            width: size.isDesktop(context: context)
                ? size.col_5(context: context)
                : size.col_12(context: context),
            child: Column(
              children: [
                Text(
                  "Solicite um orçamento!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Nome",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Telefone",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    isDense: true,
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Mensagem",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Text("Enviar", style: TextStyle(color: Colors.white, fontSize: 17),),
                      color: Colors.red,
                  )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
