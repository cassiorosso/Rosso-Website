import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:rosso_website/docs/hasura_docs.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/pages/about_us_page.dart';
import 'package:rosso_website/pages/contact_page.dart';
import 'package:rosso_website/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:rosso_website/repositories/hasura_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  //Loading env file
  await DotEnv.load(fileName: ".env");

  //Injeção de dependências Get
  Get.put<HasuraDocs>(HasuraDocs());
  Get.put<HasuraConnect>(HasuraConnect(env["HASURA_URL"]!,
      headers: {"x-hasura-admin-secret": env["HASURA_KEY"]!}));
  Get.put<IDatabase>(
      HasuraRepository(Get.find<HasuraConnect>(), Get.find<HasuraDocs>()));

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
        fontFamily: "Abadi",
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/aboutUs': (context) => AboutUsPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}
