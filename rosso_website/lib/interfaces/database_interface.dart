import 'package:rosso_website/models/message_model.dart';

abstract class IDatabase {
  Future<int> sendMessage(MessageModel message);
}
