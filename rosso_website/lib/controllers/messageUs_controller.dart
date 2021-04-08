import 'package:get/get.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/message_model.dart';

class MessageUsController {
  MessageModel messageUs =
      MessageModel(name: "", email: "", phone: "", message: "");
  final db = Get.find<IDatabase>();

  //Setters
  void setName(String? name) => messageUs.name = name!;
  void setPhone(String? phone) => messageUs.phone = phone!;
  void setEmail(String? email) => messageUs.email = email!;
  void setMessage(String? message) => messageUs.message = message!;

  //Validators
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

  void sendEmail() {
    // Logic to send Email
    db.sendMessage(messageUs);
    //repo.sendMessage(messageUs);
  }
}
