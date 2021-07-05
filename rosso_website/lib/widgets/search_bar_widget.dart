import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final _size = ScreenSize();
  final Function(String search, bool newSearch) searchAction;
  String stringSearch = "";

  SearchBar({Key? key, required this.searchAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _size.isMobile(context: context)
            ? _size.col_8(context: context)
            : _size.col_3(context: context),
        child: TextField(
          onChanged: (text) => stringSearch = text,
          onSubmitted: (_) {
            if (stringSearch.isNotEmpty) {
              FocusScope.of(context).unfocus();
              searchAction(
                  '%${stringSearch.trim().replaceAll(" ", "%")}%', true);
            }
            if (ModalRoute.of(context)!.settings.name != "/products")
              Navigator.pushNamed(context, "/products");
          },
          // onEditingComplete: () {
          //   if (stringSearch.isNotEmpty) {
          //     FocusScope.of(context).unfocus();
          //     return searchAction(
          //         '%${stringSearch.trim().replaceAll(" ", "%")}%', true);
          //   }
          // },
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(left: 15),
            suffixIcon: InkWell(
              onTap: () {
                if (stringSearch.isEmpty) return null;
                if (ModalRoute.of(context)!.settings.name != "/products")
                  Navigator.pushNamed(context, "/products");
                searchAction(
                    '%${stringSearch.trim().replaceAll(" ", "%")}%', true);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.grey[700],
                ),
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(12)),
            hintText: " Buscar produto...",
            hintStyle: TextStyle(color: Colors.grey[600])
          ),
        ));
  }
}
