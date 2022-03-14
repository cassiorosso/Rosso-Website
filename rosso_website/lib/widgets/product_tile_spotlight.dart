import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rosso_website/models/product_model.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'dart:js' as js;

import 'package:seo_renderer/renderers/image_renderer/image_renderer.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer.dart';

class ProductTileSpotLight extends StatelessWidget {
  final ProductModel product;
  final ScreenSize size = ScreenSize();

  ProductTileSpotLight({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 350,
      width: (MediaQuery.of(context).size.width > 599 && MediaQuery.of(context).size.width < 1000) ? size.col_5(context: context) : (MediaQuery.of(context).size.width > 1000) ? size.col_3(context: context) : size.col_8(context: context) ,
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.black12),
      //     borderRadius: BorderRadius.circular(5)),
      child: Card(
        elevation: 3,
        child: InkWell(
          onTap: () =>
              Navigator.pushNamed(context, "/produto/${product.id}"),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),  
              product.produtosImagens.isEmpty
                  ? Image.asset(
                      "assets/images/no_image.png",
                      fit: BoxFit.cover,
                      height: 200,
                    )
                  : ImageRenderer(
                    alt: product.nome,
                    link: product.produtosImagens[0],
                    child: Image.network(
                        product.produtosImagens[0],
                        fit: BoxFit.contain,
                        height: 200,
                      ),
                  ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: TextRenderer(
                  element: HeadingElement.h3(),
                  text: SelectableText(
                    product.nome,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize:17, color: Colors.grey[900]),
                  ),
                ),
              ),
              Container(
                width: size.isMobile(context: context) ? size.col_3(context: context) : size.col_2(context: context),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2,
                        primary: Colors.green[700],
                        onPrimary: Colors.white),
                    onPressed: () => js.context.callMethod('open', [
                          'https://api.whatsapp.com/send?phone=5554991413355&text=Olá, gostaria de mais informações sobre esse produto: ${product.nome} (${product.codReferencia})'
                        ]),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(size.isMobile(context: context)? 5 : 8),
                      child: Center(child: size.isMobile(context: context) ? Image.asset("assets/images/whatsapp.png", scale: 15,) : Text("Compre por Whatsapp",textAlign: TextAlign.center  ,style: TextStyle(fontSize: 17))),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
