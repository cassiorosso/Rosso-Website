// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.categoriaId,
    required this.codReferencia,
    //required this.createdAt,
    required this.descricao,
    required this.destaque,
    required this.estoque,
    required this.id,
    required this.nome,
    //required this.preco,
    required this.subCategoriaId,
    required this.produtosImagens,
    required this.visivel,
    //required this.updatedAt,
  });

  int categoriaId;
  final int codReferencia;
  //final DateTime createdAt;
  final String descricao;
  bool destaque;
  final int estoque;
  final int id;
  final String nome;
  //final double preco;
  int subCategoriaId;
  //final DateTime updatedAt;
  bool visivel;
  List<String> produtosImagens;

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
      categoriaId: json["categoria_id"] ?? 0,
      codReferencia: json["cod_referencia"] ?? 0,
      //createdAt: DateTime.parse(json["created_at"]),
      descricao: json["descricao"] ?? "",
      destaque: json["destaque"] ?? false,
      estoque: json["estoque"] != null ? json["estoque"].toInt() : 0,
      id: json["id"],
      nome: json["nome"],
      //preco: json["preco"],
      subCategoriaId: json["sub_categoria_id"] ?? 0,
      visivel: json["visivel"],
      //updatedAt: DateTime.parse(json["updated_at"]),
      produtosImagens:
          List<String>.from(json["produtos_imagens"].map((x) => x["url"])));

  // Map<String, dynamic> toMap() => {
  //       "categoria_id": categoriaId,
  //       "cod_referencia": codReferencia,
  //       //"created_at": createdAt.toIso8601String(),
  //       "descricao": descricao,
  //       "destaque": destaque,
  //       "estoque": estoque,
  //       "id": id,
  //       "nome": nome,
  //       //"preco": preco,
  //       "sub_categoria_id": subCategoriaId,
  //       "visivel": visivel,
  //       //"updated_at": updatedAt.toIso8601String(),
  //       "produtos_imagens": List<dynamic>.from(produtosImagens.map((x) => x))
  //     };
}
