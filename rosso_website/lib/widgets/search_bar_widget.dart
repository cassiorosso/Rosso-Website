import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final _size = ScreenSize();
  final _textFieldFocus = FocusNode();
  final Function(String search, bool newSearch) searchAction;
  String stringSearch = "";

  SearchBar({Key? key, required this.searchAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5,
      child: Container(
          height: 35,
          width: _size.isMobile(context: context)
              ? _size.col_8(context: context)
              : _size.col_3(context: context),
          child: TextField(
            focusNode: _textFieldFocus,
            onChanged: (text) => stringSearch = text,
            //onEditingComplete: () => search(context),
            onSubmitted: (_) {
              _textFieldFocus.unfocus();
              search(context);
            },
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 15),
                suffixIcon: InkWell(
                  onTap: () {
                    _textFieldFocus.unfocus();
                    search(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  //borderRadius: BorderRadius.circular(14),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    ),//borderRadius: BorderRadius.circular(14)),
                hintText: " Buscar produto...",
                hintStyle: TextStyle(color: Colors.grey[600])),
          )),
    );
  }

  void search(BuildContext context) {
    print("pesquisa");
    if (stringSearch.isNotEmpty) {
      FocusScope.of(context).unfocus();
      searchAction('%${stringSearch.trim().replaceAll(" ", "%")}%', true);
      if (ModalRoute.of(context)!.settings.name != "/produtos" &&
          ModalRoute.of(context)?.settings.name != null)
        Navigator.pushNamed(context, "/produtos");
    }
  }
}
