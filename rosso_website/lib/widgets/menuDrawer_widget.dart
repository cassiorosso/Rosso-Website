import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'package:rosso_website/utils/scree_size.dart';

class MenuDrawer extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          elevation: 1,
          child: Container(
            color: Colors.grey[300],
            child: ListView(
              children: [
                SizedBox(height: 15,),
                Container(
                  height: 60,
                  width: 100,
                  child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.contain,
                    ),
                ),
                SizedBox(height: 10,),
                ListTile(
                  title: Text("Início"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name == "/inicio")
                      Navigator.popAndPushNamed(context, "/inicio");
                    else
                      Navigator.pushNamed(context, "/inicio");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ),
                ListTile(
                  title: Text("Quem somos"),
                  leading: Icon(Icons.store_mall_directory_outlined),
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name == "/empresa")
                      Navigator.popAndPushNamed(context, "/empresa");
                    else
                      Navigator.pushNamed(context, "/empresa");
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                ListTile(
                  title: Text("Produtos"),
                  leading: Icon(Icons.add_shopping_cart_rounded),
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name == "/produtos")
                      Navigator.popAndPushNamed(context, "/produtos");
                    else
                      Navigator.pushNamed(context, "/produtos");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ),
                ListTile(
                  title: Text("Contato"),
                  leading: Icon(Icons.quick_contacts_mail_sharp),
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name == "/contato")
                      Navigator.popAndPushNamed(context, "/contato");
                    else
                      Navigator.pushNamed(context, "/contato");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("   Siga-nos nas redes sociais:"),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: size.col_2(context: context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 42,
                        height: 42,
                        child: InkWell(
                          onTap: () {
                            //Redirecionamento link Facebook
                            js.context.callMethod('open',
                                ['https://facebook.com/agricolavetrosso']);
                          },
                          child: Image.asset(
                            "assets/images/facebook.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 42,
                        height: 42,
                        child: InkWell(
                          onTap: () {
                            //Redirecionamento link Instagram
                            js.context.callMethod('open',
                                ['https://www.instagram.com/agricolavetrosso']);
                          },
                          child: Image.asset("assets/images/instagram.png",
                              fit: BoxFit.contain),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
