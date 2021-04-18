import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/message_model.dart';
import 'package:rosso_website/models/network_response_model.dart';

enum Status { LOADING, ERROR, SUCCESS, IDLE }

class MessageUsController {
  MessageModel messageUs =
      MessageModel(name: "", email: "", phone: "", message: "");
  final db = Get.find<IDatabase>();
  NetworkResponseModel returnMessage = NetworkResponseModel(data: "", error: "");
  Status status = Status.IDLE;

  MessageUsController();

  //Setters
  void setName(String? name) => messageUs.name = name!;
  void setPhone(String? phone) => messageUs.phone = phone!;
  void setEmail(String? email) => messageUs.email = email!;
  void setMessage(String? message) => messageUs.message = message!;

  //Input Validators
  String? validateString(String? value) =>
      value!.isEmpty ? 'Por favor, preencha esse campo!' : null;

  String? validateEmail(String? value) {
    if (value!.isEmpty)
      return 'Por favor, preencha esse campo!';
    else if (!value.contains("@"))
      return "E-mail está em formato invalido";
    else
      return null;
  }

  Future<void> sendEmail(VoidCallback refreshPage) async {
    // Logic to send Email
    status = Status.LOADING;
    refreshPage();
    returnMessage = await db.sendMessage(messageUs);
    if (returnMessage.error.isEmpty)
      status = Status.SUCCESS;
    else
      status = Status.ERROR;
    refreshPage();
  }
}
