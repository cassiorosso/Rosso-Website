import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rosso_website/models/product_model.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'dart:js' as js;

import 'package:seo_renderer/renderers/image_renderer/image_renderer.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final ScreenSize size = ScreenSize();

  ProductTile({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 350,
      width: (MediaQuery.of(context).size.width > 599 && MediaQuery.of(context).size.width < 1000) ? size.col_3(context: context) : (MediaQuery.of(context).size.width > 1000) ? size.col_3(context: context) : size.col_5(context: context) ,
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.black12),
      //     borderRadius: BorderRadius.circular(5)),
      child: Card(
        elevation: 3,
        child: InkWell(
          onTap: () =>
              Navigator.pushNamed(context, "/produto/${product.id}",),
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
                        fit: BoxFit.contain, //size.isMobile(context: context) ? BoxFit.contain : BoxFit.cover,
                        height: 220,
                      ),
                  ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextRenderer(
                  element: HeadingElement.h3(),
                  text: SelectableText(
                    product.nome,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize:16, color: Colors.grey[900]),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      primary: Colors.green[700],
                      onPrimary: Colors.white),
                  onPressed: () => js.context.callMethod('open', [
                        'https://api.whatsapp.com/send?phone=5554991413355&text=Olá, gostaria de mais informações sobre esse produto: ${product.nome} (${product.codReferencia})'
                      ]),
                  child: Container(
                    width: size.col_2(context: context),
                    padding: EdgeInsets.all(size.isMobile(context: context)? 5 : 8),
                    child: Center(child: size.isMobile(context: context) ? Image.asset("assets/images/whatsapp.png", scale: 20,) : Text("Compre por Whatsapp",textAlign: TextAlign.center  ,style: TextStyle(fontSize: 17))),
                  )),
              SizedBox(
                height: 2,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      primary: Colors.grey,
                      onPrimary: Colors.white),
                  onPressed: () => Navigator.pushNamed(context, "/produto/${product.id}",),
                  child: Container(
                    width: size.col_2(context: context),
                    padding: EdgeInsets.all(size.isMobile(context: context)? 5 : 8),
                    child: Center(child: size.isMobile(context: context) ? Icon(Icons.info_outline, size: 25,) : Text("Detalhes",textAlign: TextAlign.center  ,style: TextStyle(fontSize: 17))),
                  )),
                  SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
