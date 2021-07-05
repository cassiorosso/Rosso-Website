import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/login_controller.dart';
import 'package:rosso_website/pages/admin_page.dart';
import 'package:rosso_website/utils/scree_size.dart';

class LoginPage extends StatelessWidget {
  final size = ScreenSize();
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";

    final emailField = TextField(
      obscureText: false,
      onChanged: (text) => email = text,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
    final passwordField = TextField(
      obscureText: true,
      onSubmitted: (text) async {
        if (await _loginController.loginUser(email, password))
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => AdminPage()));
        else
          showAboutDialog(children: [
            Container(
              child: Text("Login não foi possível!"),
            ),
          ], context: context);
      },
      onChanged: (text) => password = text,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20),
      color: Colors.green[700],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (await _loginController.loginUser(email, password))
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => AdminPage()));
          else
            showAboutDialog(children: [
              Container(
                child: Text("Login não foi possível!"),
              ),
            ], context: context);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            height: 500,
            width: size.isDesktop(context: context)
                ? size.col_6(context: context)
                : size.col_10(context: context),
            color: Colors.white,
            child: Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 50),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
  /*Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: size.col_12(context: context),
          child: Center(
            child: Container(
              width: size.isDesktop(context: context) ? size.col_7(context: context) : size.col_10(context: context),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: "Email", border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Senha", border: OutlineInputBorder()),
                      obscureText: true,
                      onSubmitted: (text) {
                        print(text);
                        var bytes = utf8.encode(text);
                        var encrypted = sha512.convert(bytes);
                        print(encrypted);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }*/
}
