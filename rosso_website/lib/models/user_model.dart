// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);
import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
    UserModel({
        //required this.cep,
        required this.email,
        //@required this.enderecoNome,
        //@required this.enderecoNumero,
        //@required this.telefone,
        //required this.nome,
        required this.token,
    });

    //final String cep;
    final String email;
    //final String enderecoNome;
    //final int enderecoNumero;
    //final String telefone;
    //final String nome;
    final String token;

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        //cep: json["cep"],
        email: json["email"],
        //enderecoNome: json["endereco_nome"],
        //enderecoNumero: json["endereco_numero"],
        //telefone: json["telefone"],
        //nome: json["nome"],
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        //"cep": cep,
        "email": email,
        //"endereco_nome": enderecoNome,
        //"endereco_numero": enderecoNumero,
        //"telefone": telefone,
        //"nome": nome,
        "token": token,
    };
}
