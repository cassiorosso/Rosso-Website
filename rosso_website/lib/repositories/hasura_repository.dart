import 'package:hasura_connect/hasura_connect.dart';
import 'package:rosso_website/docs/hasura_docs.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/message_model.dart';
import 'package:rosso_website/models/network_response_model.dart';

class HasuraRepository implements IDatabase {
  final HasuraConnect _hasuraConnect;
  final HasuraDocs _hasuraDocs;

  HasuraRepository(this._hasuraConnect, this._hasuraDocs);

  @override
  Future<NetworkResponseModel> sendMessage(MessageModel message) async {
    NetworkResponseModel response = NetworkResponseModel(error: "", data: "");

    try {
      final snapshot = await _hasuraConnect
          .mutation(_hasuraDocs.sendMessageMutation, variables: {
        "nome": message.name,
        "email": message.email,
        "telefone": message.phone,
        "mensagem": message.message
      });
      response.data =
          snapshot["data"]["insert_mensagens"]["returning"][0]["mensagem_id"];
      return response;
    } on Exception catch (e) {
      print(e.toString());
      response.error = "${e.toString()}";
      return response;
    }
  }

  // String _errorHasuraMessage(Map response) {
  //   if (response.containsKey("errors")) {
  //     String error = '';
  //     for (var e in response['errors']) {
  //       error = error + "${e["extensions"]["code"]} - ${e["message"]}\n";
  //     }
  //     return error;
  //   } else
  //     return "";
  // }
}
