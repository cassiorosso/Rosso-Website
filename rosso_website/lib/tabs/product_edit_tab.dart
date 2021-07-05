import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/products_tab_controller.dart';
import 'package:rosso_website/stores/categories_store.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/paginate_widget.dart';
import 'package:rosso_website/widgets/product_edit_widget.dart';
import 'package:rosso_website/widgets/search_bar_widget.dart';

class ProductEditTab extends StatefulWidget {
  @override
  _ProductEditTabState createState() => _ProductEditTabState();
}

class _ProductEditTabState extends State<ProductEditTab> {
  final _controller = Get.find<ProductsTabController>();
  final categoriesStore = Get.find<CategoriesStore>();
  final ScreenSize size = ScreenSize();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Function jumToTop = () {
      setState(() {
        if (_scrollController.hasClients)
          _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      });
    };

    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: true,
      //showTrackOnHover: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          width: size.totalWidth(context: context),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SearchBar(searchAction: _controller.searchProduct),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      primary: Colors.green[700],
                      onPrimary: Colors.white),
                  onPressed: () => _controller.getProducts(true),
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      "Carregar todos os produtos",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      primary: Colors.green[700],
                      onPrimary: Colors.white),
                  onPressed: () => _controller.getCategory(true),
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      "Carregar Categoria Cachorros > Alimentação",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                if (_controller.productsStatus.value == Status.ERROR ||
                    _controller.productsStatus.value == Status.IDLE)
                  return Container(child: Text("Erro"));
                else if (_controller.productsStatus.value == Status.LOADING)
                  return Container(
                      alignment: Alignment.topCenter,
                      height: 1000,
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator());
                else
                  return Column(
                    children: [
                      Container(
                        //width: size.col_8(context: context),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _controller.products.length,
                            itemBuilder: (context, index) => ProductEditWidget(
                                product: _controller.products[index],
                                categoriesStore: categoriesStore)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PaginateWidget(
                          currentPage: _controller.currentPage,
                          pages: _controller.pages,
                          changePage: _controller.changePage,
                          jumpToTop: jumToTop)
                    ],
                  );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
