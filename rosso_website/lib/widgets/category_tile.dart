import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/products_controller.dart';
import 'package:rosso_website/controllers/products_tab_controller.dart';
import 'package:rosso_website/models/category_model.dart';

class CategoryTile extends StatefulWidget {
  final CategoryModel category;

  CategoryTile({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  final _controller = Get.find<ProductsController>();
  final _productsTabController = Get.find<ProductsTabController>();

  int underlinedselection = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionTile(
        expandedAlignment: Alignment.centerLeft,
        title: Text(
          widget.category.nome,
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
              fontSize: 19),
        ),
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.category.produtosSubCategorias
                  .map((e) => Container(
                        color: Colors.white70,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: InkWell(
                          onHover: (hover) {
                            setState(() {
                              if (hover == true)
                                underlinedselection = e.id;
                              else
                                underlinedselection = -1;
                            });
                          },
                          onTap: () {
                            if (ModalRoute.of(context)!.settings.name ==
                                "/produtos") {
                              Navigator.pushReplacementNamed(
                                context, "/produtos");    
                              _controller.subCategoryId = e.id;
                              _controller.getProductsBySubCategory(true);
                            } else {
                              _productsTabController.subCategoryId = e.id;
                              _productsTabController.getCategory(true);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Text(
                              e.nome,
                              style: TextStyle(
                                  color: underlinedselection != e.id
                                      ? Colors.grey[800]
                                      : Colors.green[900],
                                  fontSize: 16,
                                  fontWeight: underlinedselection != e.id
                                      ? FontWeight.w500
                                      : FontWeight.w600,
                                  decoration: underlinedselection == e.id
                                      ? TextDecoration.underline
                                      : TextDecoration.none),
                            ),
                          ),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
