import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/products_controller.dart';
import 'package:rosso_website/stores/categories_store.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/categories_widget.dart';
import 'package:rosso_website/widgets/products_list_widget.dart';

//enum Status { LOADING, ERROR, SUCCESS, IDLE }

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ScreenSize size = ScreenSize();

  final _categoriesStore = Get.find<CategoriesStore>();

  final _controller = Get.find<ProductsController>();

  //final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Function jumToTop = () {
      setState(() {
        var scrollParent = context.findAncestorWidgetOfExactType<Scrollbar>();
        if (scrollParent!.controller!.hasClients)
          scrollParent.controller!
              .jumpTo(scrollParent.controller!.position.minScrollExtent);
      });
    };

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_controller.firstLoading == false &&
          _controller.typesProductsRequest != "Pesquisa")
        _controller.getProducts(true);
    });

    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Visibility(
            visible: size.isMobile(context: context),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 2,
                    primary: Colors.red[400],
                    onPrimary: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Text(
                    "Categorias",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ))),
        SizedBox(
          height: 15,
        ),
        Container(
          width: size.col_12(context: context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: size.isMobile(context: context) == false,
                child: Container(
                  width: (MediaQuery.of(context).size.width < 1000)
                      ? size.col_4(context: context)
                      : size.col_2_5(context: context),
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
                        isInDrawer: false,
                      );
                  }),
                ),
              ),
              Container(
                color: Colors.white12,
                width: (MediaQuery.of(context).size.width > 599 &&
                        MediaQuery.of(context).size.width < 1000)
                    ? size.col_7(context: context)
                    : (MediaQuery.of(context).size.width > 1000)
                        ? size.col_9_5(context: context)
                        : size.col_11(context: context),
                child: Obx(() {
                  if (_controller.productStatus.value == Status.IDLE ||
                      _controller.productStatus.value == Status.LOADING)
                    return Container(
                        padding: EdgeInsets.all(10),
                        height: 80,
                        width: 80,
                        child: Center(
                            child: Center(child: CircularProgressIndicator())));
                  else if (_controller.productStatus.value == Status.ERROR)
                    return Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        child: Center(
                            child: Text(
                                "\n\nErro:\n${_controller.response.error}")));
                  else {
                    if (_controller.products.isEmpty)
                      return Container(
                          padding: EdgeInsets.all(10),
                          child: Center(
                              child: Text("\n\nNenhum produto encontrado!",
                                  style: TextStyle(fontSize: 20))));
                    else {
                      return Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _controller.textInfo,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ProductsListWidget(
                            products: _controller.products,
                            pages: _controller.pages,
                            currentPage: _controller.currentPage,
                            changePage: _controller.changePage,
                            jumpToTop: jumToTop,
                          ),
                        ],
                      );
                    }
                  }
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
