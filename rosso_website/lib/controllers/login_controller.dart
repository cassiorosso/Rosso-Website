import 'package:get/get.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/network_response_model.dart';
import 'package:rosso_website/models/user_model.dart';
import 'package:rosso_website/stores/user_store.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class LoginController {
  final db = Get.find<IDatabase>();
  final _userStore = Get.find<UserStore>();
  NetworkResponseModel response =
      NetworkResponseModel(data: "", error: "", count: 0);

  Future<bool> loginUser(String email, String password) async {
    var encode = utf8.encode(password);
    var encryptedPassword = sha512.convert(encode);
    response = await db.login(email: email, password: encryptedPassword.toString());
    if (response.data.isNotEmpty && response.error.isEmpty) {
      _userStore.storeLoginCredential(UserModel(email: email, token: password));
      return true;
    }
    return false;
  }
}
