import 'package:rosso_website/models/message_model.dart';
import 'package:rosso_website/models/network_response_model.dart';

abstract class IDatabase {
  Future<NetworkResponseModel> sendMessage(MessageModel message);
}
