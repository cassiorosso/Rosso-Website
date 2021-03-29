import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
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
          onTap: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        ),
        ListTile(
          title: Text("Sobre Nós"),
          leading: Icon(Icons.store_mall_directory_outlined),
          onTap: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2), side: BorderSide(color: Colors.black),
        ),
        )],
    )),
  );
}
}
