import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/product_controller.dart';
import 'package:rosso_website/stores/categories_store.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:js' as js;

class ProductPage extends StatefulWidget {
  final int productId;

  ProductPage({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ScreenSize size = ScreenSize();
  final categoriesStore = Get.find<CategoriesStore>();
  final _controller = ProductController();

  @override
  void initState() {
    _controller.getProduct(widget.productId).then((_) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
        ),
        Builder(builder: (_) {
          if (_controller.productStatus == Status.LOADING)
            return Container(
                padding: EdgeInsets.all(10),
                height: 80,
                width: 80,
                child:
                    Center(child: Center(child: CircularProgressIndicator())));
          else if (_controller.productStatus == Status.ERROR)
            return Container(
                padding: EdgeInsets.all(10),
                height: 50,
                width: 50,
                child: Center(
                    child: Text("\n\nErro:\n${_controller.response.error}")));
          else {
            if (_controller.response.data == "")
              return Container(
                  padding: EdgeInsets.all(5),
                  child: Center(
                      child: Text("\n\nNenhum produto encontrado!",
                          style: TextStyle(fontSize: 20))));
            else {
              CarouselController buttonCarouselController =
                  CarouselController();
              final String categoria = categoriesStore.allCategories
                  .singleWhere((element) =>
                      element.id == _controller.produto.categoriaId)
                  .nome;
              final String subCategoria = categoriesStore.allCategories
                  .singleWhere((element) => element.nome == categoria)
                  .produtosSubCategorias
                  .singleWhere((element) =>
                      element.id == _controller.produto.subCategoriaId)
                  .nome;
              return Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Stack(
                    children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12)),
                      width: size.isDesktop(context: context)
                          ? size.col_5(context: context)
                          : size.col_10(context: context),
                      //padding: EdgeInsets.symmetric(
                      //    horizontal: 22, vertical: 22),
                      child: CarouselSlider(
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            height: 400,
                            viewportFraction: 1,
                            autoPlay: false,
                          ),
                          items: _controller.produto.produtosImagens.isEmpty
                              ? [
                                  Image.asset(
                                    "assets/images/no_image.png",
                                    fit: BoxFit.cover,
                                    height: 200,
                                  )
                                ]
                              : _controller.produto.produtosImagens
                                  .map((e) => Image.network(e))
                                  .toList()),
                    ),
                    Positioned(
                        right: 10,
                        top: 180,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: _controller.produto.produtosImagens.length <=1 ? Colors.transparent : Colors.grey[600],
                          ),
                          iconSize: 36,
                          onPressed: () {
                            buttonCarouselController.nextPage();
                          },
                        )),
                        Positioned(
                        left: 10,
                        top: 180,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: _controller.produto.produtosImagens.length <=1 ? Colors.transparent : Colors.grey[600],
                          ),
                          iconSize: 36,
                          onPressed: () {
                            buttonCarouselController.previousPage();
                          },
                        )),
                  ]),
                  Container(
                    width: size.isDesktop(context: context)
                        ? size.col_5(context: context)
                        : size.col_8(context: context),
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                          _controller.produto.nome,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        Text("$categoria > $subCategoria",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Referência: ${_controller.produto.codReferencia.toString()}",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 2,
                                primary: Colors.green[700],
                                onPrimary: Colors.white),
                            onPressed: () => js.context.callMethod('open', [
                                  'https://api.whatsapp.com/send?phone=5554991413355&text=Olá, gostaria de encomendar esse produto: ${_controller.produto.nome} (${_controller.produto.codReferencia})'
                                ]),
                            child: Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "Compre por Whatsapp",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Container(
                                    height: 28,
                                    width: 28,
                                    child: Image.asset(
                                        "assets/images/whatsapp.png"),
                                  )
                                ],
                              ),
                            )),
                        Text(
                            "\n\n*Venda por Whatsapp válida apenas para Passo Fundo - RS")
                      ],
                    ),
                  ),
                  Container(
                      width: size.col_10(context: context),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "DESCRIÇÃO  ",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                border: Border.all(color: Colors.black12)),
                            child: Html(
                              data: _controller.produto.descricao,
                            ),
                          ),
                        ],
                      )),
                ],
              );
            }
          }
        }),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
