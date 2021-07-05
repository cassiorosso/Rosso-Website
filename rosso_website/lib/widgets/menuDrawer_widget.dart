import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosso_website/stores/categories_store.dart';
import 'dart:js' as js;

import 'package:rosso_website/utils/scree_size.dart';

import 'categories_widget.dart';

class MenuDrawer extends StatelessWidget {
  final ScreenSize size = ScreenSize();
  final _categoriesStore = Get.find<CategoriesStore>();

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
                    if (ModalRoute.of(context)!.settings.name == "/home")
                      Navigator.popAndPushNamed(context, "/home");
                    else
                      Navigator.pushNamed(context, "/home");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ),
                ListTile(
                  title: Text("Quem somos"),
                  leading: Icon(Icons.store_mall_directory_outlined),
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name == "/aboutUs")
                      Navigator.popAndPushNamed(context, "/aboutUs");
                    else
                      Navigator.pushNamed(context, "/aboutUs");
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                ListTile(
                  title: Text("Produtos"),
                  leading: Icon(Icons.add_shopping_cart_rounded),
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name == "/products")
                      Navigator.popAndPushNamed(context, "/products");
                    else
                      Navigator.pushNamed(context, "/products");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ),
                ListTile(
                  title: Text("Contato"),
                  leading: Icon(Icons.quick_contacts_mail_sharp),
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name == "/contact")
                      Navigator.popAndPushNamed(context, "/contact");
                    else
                      Navigator.pushNamed(context, "/contact");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                  color: Colors.white,
                  height: 1,
                ),
                Container(
                  width: size.isTablet(context: context)
                      ? size.col_4(context: context)
                      : (MediaQuery.of(context).size.width >= 800 &&
                              MediaQuery.of(context).size.width <= 1200)
                          ? size.col_3(context: context)
                          : size.col_2(context: context),
                  child: Obx(() {
                    if (_categoriesStore.allCategories.length == 0)
                      return Container(
                          padding: EdgeInsets.all(10),
                          height: 80,
                          width: 80,
                          child: Center(child: CircularProgressIndicator()));
                    else
                      return CategoriesWidget(
                        categories: _categoriesStore.allCategories,
                        isInDrawer: true,
                      );
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("  Siga-nos nas redes sociais:"),
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
                        width: 10,
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
