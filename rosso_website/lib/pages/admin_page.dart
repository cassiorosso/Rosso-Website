import 'package:flutter/material.dart';
import 'package:rosso_website/tabs/messages_tab.dart';
import 'package:rosso_website/tabs/product_edit_tab.dart';
import 'package:rosso_website/utils/scree_size.dart';

class AdminPage extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              "Agrícola Veterinária Rosso - Admin",
              style: TextStyle(color: Colors.white),
            ),
            bottom: TabBar(tabs: [
              Tab(
                text: "Produtos",
              ),
              Tab(
                text: "Mensagens",
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              ProductEditTab(),
              MessagesTab(),
          ])),
    );
  }
}
