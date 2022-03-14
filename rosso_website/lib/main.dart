import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:rosso_website/controllers/home_controller.dart';
import 'package:rosso_website/controllers/messages_tab_controller.dart';
import 'package:rosso_website/controllers/products_controller.dart';
import 'package:rosso_website/docs/hasura_docs.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:get/get.dart';
import 'package:rosso_website/repositories/hasura_repository.dart';
import 'package:rosso_website/routes/route_generator.dart';
import 'package:rosso_website/stores/categories_store.dart';
import 'package:rosso_website/stores/user_store.dart';
import 'controllers/login_controller.dart';
import 'controllers/products_tab_controller.dart';
import 'docs/hasura_docs.dart';
import 'package:seo_renderer/seo_renderer.dart';

Future main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //Injeção de dependências Get
  Get.put<HasuraDocs>(HasuraDocs());
  Get.put<HasuraConnect>(HasuraConnect(
      "https://sought-kodiak-55.hasura.app/v1/graphql",
      headers: {"content-type": "application/json"}));
  Get.put<IDatabase>(
      HasuraRepository(Get.find<HasuraConnect>(), Get.find<HasuraDocs>()));
  Get.put<HomeController>(HomeController());
  Get.put<CategoriesStore>(CategoriesStore());
  Get.lazyPut<ProductsController>(() => ProductsController());
  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<UserStore>(() => UserStore());
  Get.lazyPut<MessagesTabController>(() => MessagesTabController(),
      fenix: true);
  Get.lazyPut<ProductsTabController>(() => ProductsTabController(),
      fenix: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agrícola Veterinária Rosso ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //fontFamily: "Montserrat",
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/inicio',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorObservers: [routeObserver],
    );
  }
}
