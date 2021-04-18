import 'package:flutter/material.dart';
import 'package:rosso_website/controllers/messageUs_controller.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'package:rosso_website/widgets/facebookPage_widget.dart';

class MessageUsWidget extends StatefulWidget {
  @override
  _MessageUsWidgetState createState() => _MessageUsWidgetState();
}

class _MessageUsWidgetState extends State<MessageUsWidget> {
  final ScreenSize size = ScreenSize();
  final _messageUsController = MessageUsController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final VoidCallback refreshPage = () => setState(() {});
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/polygon.png"), fit: BoxFit.fill),
        //color: Colors.green[700],
        // gradient: LinearGradient(
        //   colors: [
        //     Color(0xFF02872c),
        //     Color(0xFF09b523),
        //   ],
        //   stops: [0, 20],

        // )
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: size.col_12(context: context),
      child: Form(
        key: _formKey,
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            Container(
              width: size.isDesktop(context: context)
                  ? size.col_5(context: context)
                  : size.col_12(context: context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nos acompanhe no Facebook\ne compartilhe com seus amigos!",
                    style: TextStyle(
                        height: 1,
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: "Tanseek Modern Pro Arabic"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 430,
                    height: 350,
                    child: FacebookPage(),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            Container(
              width: size.isDesktop(context: context)
                  ? size.col_5(context: context)
                  : size.col_12(context: context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mande uma mensagem\nou solicite um orçamento!",
                    style: TextStyle(
                        height: 1,
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: "Tanseek Modern Pro Arabic"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: _messageUsController.validateString,
                    onSaved: _messageUsController.setName,
                    decoration: InputDecoration(
                        isDense: true,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Nome",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: _messageUsController.validateEmail,
                    onSaved: _messageUsController.setEmail,
                    decoration: InputDecoration(
                        isDense: true,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: _messageUsController.validateString,
                    onSaved: _messageUsController.setPhone,
                    decoration: InputDecoration(
                        isDense: true,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Telefone",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: _messageUsController.validateString,
                    onSaved: _messageUsController.setMessage,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Mensagem",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Builder(builder: (BuildContext context) {
                        if (_messageUsController.status == Status.LOADING)
                          return Container(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          );
                        if (_messageUsController.status == Status.ERROR)
                          return Text(
                            "Erro ao enviar mensagem!\n${_messageUsController.returnMessage.error}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.red[600]),
                          );
                        if (_messageUsController.status == Status.SUCCESS)
                          return Text(
                            "Mensagem enviada com sucesso!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red[600]),
                          );
                        else
                          return Text("");
                      }),
                      Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              primary: Colors.red,
                              onPrimary: Colors.white),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await _messageUsController.sendEmail(refreshPage);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Enviar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            //color: Colors.red,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
