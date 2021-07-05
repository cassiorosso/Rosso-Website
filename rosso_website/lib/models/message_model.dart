// To parse this JSON data, do
//
//     final messageModel = messageModelFromMap(jsonString);

import 'dart:convert';

MessageModel messageModelFromMap(String str) => MessageModel.fromMap(json.decode(str));

class MessageModel {
    MessageModel({
        required this.telefone,
        required this.nome,
        required this.mensagem,
        required this.lido,
        required this.id,
        required this.email,
        required this.createdAt,
    });

    String telefone;
    String nome;
    String mensagem;
    bool lido;
    int? id;
    String email;
    DateTime? createdAt;

    factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        telefone: json["telefone"],
        nome: json["nome"],
        mensagem: json["mensagem"],
        lido: json["lido"],
        id: json["id"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
    );
}
