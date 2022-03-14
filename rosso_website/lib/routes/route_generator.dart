import 'package:flutter/material.dart';
import 'package:rosso_website/pages/about_us_page.dart';
import 'package:rosso_website/pages/base_page.dart';
import 'package:rosso_website/pages/contact_page.dart';
import 'package:rosso_website/pages/home_page.dart';
import 'package:rosso_website/pages/login_page.dart';
import 'package:rosso_website/pages/product_page.dart';
import 'package:rosso_website/pages/products_page.dart';
import 'package:rosso_website/routes/generate_page_route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    //final args = settings.arguments;
    RegExp _numericInt = RegExp(r'^[0-9]+$');
    int productId = 0;

    final List<String> splittedRouteName = settings.name!.split("/");
    if (splittedRouteName.length == 3 &&
        splittedRouteName[1] == 'produto' &&
        _numericInt.hasMatch(splittedRouteName[2]) == true) {
      productId = int.parse(splittedRouteName[2]);
      return GeneratePageRoute(
          widget: BasePage(widget: ProductPage(productId: productId)),
          routeName: '/produto/$productId');
    }

    switch (settings.name) {
      case '/inicio':
        return GeneratePageRoute(
            widget: BasePage(widget: HomePage()),
            routeName:
                '/inicio'); //MaterialPageRoute(builder: (_) => HomePage());
      case '/empresa':
        return GeneratePageRoute(
            widget: BasePage(widget: AboutUsPage()) ,
            routeName:
                '/empresa'); //MaterialPageRoute(builder: (_) => AboutUsPage());
      case '/contato':
        return GeneratePageRoute(
            widget: BasePage(widget: ContactPage()) ,
            routeName:
                '/contato'); //MaterialPageRoute(builder: (_) => ContactPage());
      case '/produtos':
        return GeneratePageRoute(
            widget: BasePage(widget: ProductsPage()) ,
            routeName:
                '/produtos'); //MaterialPageRoute(builder: (_) => ProductsPage());
      case '/login':
        //return MaterialPageRoute(builder: (_) => LoginPage());
       return GeneratePageRoute(widget: LoginPage(), routeName: '/login');
      // case '/product':
      //   // Validation of correct data type
      //   if (args is ProductModel) {
      //     return GeneratePageRoute(
      //       widget: ProductPage(
      //         product: args,
      //       ),
      //       routeName: '/product',
      //     );
      //  }
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      //  return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Página não encontrada"),
      ),  
      body: Container(
        child: Image.asset(
            "assets/images/404_error.png",
            fit: BoxFit.cover,
          ),
      )
    );
    });
  }
}
