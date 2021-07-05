import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rosso_website/models/product_model.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/paginate_widget.dart';
import 'package:rosso_website/widgets/product_tile.dart';

class ProductsListWidget extends StatelessWidget {
  final List<ProductModel> products;
  final int pages;
  final int currentPage;
  final size = ScreenSize();
  final Function(int) changePage;
  final Function jumpToTop;

  ProductsListWidget(
      {Key? key,
      required this.products,
      required this.pages,
      required this.currentPage,
      required this.changePage,
      required this.jumpToTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: (MediaQuery.of(context).size.width > 600) ? size.col_9(context: context) : size.col_11(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            //runSpacing: 10,
            //spacing: 2,
            children: products.map((e) => ProductTile(product: e)).toList(),
          ),
          SizedBox(height: 10),
          PaginateWidget(
            changePage: changePage,
            currentPage: currentPage,
            jumpToTop: jumpToTop,
            pages: pages,
          ),
        ],
      ),
    );
  }
}
