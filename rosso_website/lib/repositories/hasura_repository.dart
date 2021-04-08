import 'package:hasura_connect/hasura_connect.dart';
import 'package:rosso_website/docs/hasura_docs.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/message_model.dart';

class HasuraRepository implements IDatabase {
  final HasuraConnect _hasuraConnect;
  final HasuraDocs _hasuraDocs;

  HasuraRepository(this._hasuraConnect, this._hasuraDocs);

  @override
  Future<int> sendMessage(MessageModel message) async {
    var snapshot = await _hasuraConnect
        .mutation(_hasuraDocs.sendMessageMutation, variables: {
      "nome": message.name,
      "email": message.email,
      "telefone": message.phone,
      "mensagem": message.message
    });

    print(snapshot.toString());
    return snapshot["data"]["insert_mensagens"]["returning"][0]["mensagem_id"];
  }
}
