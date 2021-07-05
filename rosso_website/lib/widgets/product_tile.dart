import 'package:flutter/material.dart';
import 'package:rosso_website/models/product_model.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'dart:js' as js;

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
              Navigator.pushNamed(context, "/product/${product.id}",),
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
                  : Image.network(
                      product.produtosImagens[0],
                      fit: BoxFit.contain, //size.isMobile(context: context) ? BoxFit.contain : BoxFit.cover,
                      height: 220,
                    ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Text(
                  product.nome,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize:16, color: Colors.grey[900]),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      primary: Colors.green[700],
                      onPrimary: Colors.white),
                  onPressed: () => js.context.callMethod('open', [
                        'https://api.whatsapp.com/send?phone=5554991413355&text=Olá, gostaria de encomendar esse produto: ${product.nome} (${product.codReferencia})'
                      ]),
                  child: Container(
                    width: size.col_2(context: context),
                    padding: EdgeInsets.all(size.isMobile(context: context)? 5 : 8),
                    child: Center(child: size.isMobile(context: context) ? Image.asset("assets/images/whatsapp.png", scale: 15,) : Text("Compre por Whatsapp",textAlign: TextAlign.center  ,style: TextStyle(fontSize: 17))),
                  )),
              SizedBox(
                height: 10,
              )    
            ],
          ),
        ),
      ),
    );
  }
}
