import 'package:rosso_website/models/user_model.dart';

class UserStore {
  late UserModel userStore;

  storeLoginCredential(UserModel user) {
    userStore = user;
  }
}
