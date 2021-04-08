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
          child: ListView(
            children: [
              ListTile(
                title: Text("Início"),
                leading: Icon(Icons.home),
                onTap: () => Navigator.pushNamed(context, '/home'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              ListTile(
                title: Text("Quem somos"),
                leading: Icon(Icons.store_mall_directory_outlined),
                onTap: () => Navigator.pushNamed(context, '/aboutUs'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                  side: BorderSide(color: Colors.black),
                ),
              ),
              ListTile(
                title: Text("Produtos"),
                leading: Icon(Icons.add_shopping_cart_rounded),
                onTap: () => Navigator.pushNamed(context, '/home'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              ListTile(
                title: Text("Contato"),
                leading: Icon(Icons.quick_contacts_mail_sharp),
                onTap: () => Navigator.pushNamed(context, '/contact'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                color: Colors.grey,
                height: 1,
              ),
              SizedBox(height: 40,),
              Text("  Siga-nos nas redes sociais:"),
              SizedBox(height: 15,),
              Container(
                width: size.col_2(context: context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15,),
                    Container(
                      width: 35,
                      height: 35,
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
                      width: 35,
                      height: 35,
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
                  ],
                ),
              )
            ],
          )),
    );
  }
}
