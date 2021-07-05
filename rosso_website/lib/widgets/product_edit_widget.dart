import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/products_tab_controller.dart';
import 'package:rosso_website/models/product_model.dart';
import 'package:rosso_website/stores/categories_store.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/loading_dialog_widget.dart';

class ProductEditWidget extends StatelessWidget {
  final size = ScreenSize();
  final ProductModel product;
  final CategoriesStore categoriesStore;
  final _controller = Get.find<ProductsTabController>();

  ProductEditWidget(
      {Key? key, required this.product, required this.categoriesStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      width: size.col_11(context: context),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        //alignment: WrapAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    width: size.col_3(context: context),
                    child: Text(
                      product.nome,
                      style: TextStyle(fontSize: 16),
                    )),
                SizedBox(
                  height: 8,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    width: size.col_3(context: context),
                    child: Text(
                      "código referência: ${product.codReferencia}",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )),
                SizedBox(
                  height: 15,
                ),
                Text("Categoria:"),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: size.col_3(context: context),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      isDense: true,
                      value: product.categoriaId,
                      onChanged: (value) {
                        product.categoriaId = value!;
                        product.subCategoriaId = categoriesStore.allCategories
                            .singleWhere((element) => element.id == value)
                            .produtosSubCategorias[0]
                            .id;
                        _controller.updateProduct(product, false);
                      },
                      items: categoriesStore.allCategories
                          .map((e) => DropdownMenuItem(
                              value: e.id, child: Text(e.nome)))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Sub categoria:"),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: size.col_3(context: context),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                        isDense: true,
                        value: product.subCategoriaId,
                        onChanged: (value) {
                          product.subCategoriaId = value!;
                          _controller.updateProduct(product, false);
                        },
                        items: categoriesStore.allCategories
                            .singleWhere(
                                (element) => element.id == product.categoriaId)
                            .produtosSubCategorias
                            .map((e) => DropdownMenuItem(
                                value: e.id, child: Text(e.nome)))
                            .toList()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.col_3(context: context),
                  alignment: Alignment.centerRight,
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: product.visivel,
                    onChanged: (value) {
                      product.visivel = value!;
                      _controller.updateProduct(product, false);
                    },
                    title: Text("Visível"),
                  ),
                ),
                Container(
                  width: size.col_3(context: context),
                  alignment: Alignment.centerRight,
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: product.destaque,
                    onChanged: (value) {
                      product.destaque = value!;
                      _controller.updateProduct(product, false);
                    },
                    title: Text("Destaque"),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: size.col_3(context: context),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: Colors.red[700],
                          onPrimary: Colors.white),
                      onPressed: () async {
                        loadingDialog(context);
                        bool result =
                            await _controller.updateProduct(product, true);
                        Navigator.pop(context);
                        if (result == true)
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar("Produto salvo com sucesso!", true));
                        else
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar("Erro ao salvar produto!", false));
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Text(
                          "Salvar",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 7),
            width: size.col_7(context: context),
            child: Wrap(
              runSpacing: 5,
              spacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: product.produtosImagens
                  .map((e) => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Color(0xFFEAE2E0)),
                      ),
                      margin: EdgeInsets.only(right: 5),
                      //padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      width: size.col_2(context: context),
                      child: Stack(children: [
                        Image.network(e, fit: BoxFit.contain),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: Card(
                              color: Colors.grey[400],
                              child: IconButton(
                                hoverColor: Colors.red[600],
                                iconSize: 25,
                                onPressed: () => _controller
                                    .deleteImageFromStorage(e, product.id),
                                icon: Icon(Icons.delete, color: Colors.white),
                              ),
                            )),
                      ])))
                  .toList()
                    ..add(Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      child: Card(
                        color: Colors.grey[400],
                        elevation: 3,
                        child: IconButton(
                          hoverColor: Colors.blue,
                          iconSize: 36,
                          onPressed: (){
                            loadingDialog(context);
                            _controller.uploadToStorage(product);
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.add_a_photo_rounded,
                              color: Colors.white),
                        ),
                      ),
                    )),
            ),
          ),
        ],
      ),
    );
  }

  SnackBar snackBar(String text, bool success) {
    return SnackBar(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        content: Text(text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: success == true ? Colors.green : Colors.red);
  }
}
