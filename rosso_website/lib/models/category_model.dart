// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromMap(jsonString);

import 'dart:convert';

class CategoryModel {
    CategoryModel({
        required this.id,
        required this.nome,
        required this.produtosSubCategorias,
    });

    final int id;
    final String nome;
    final List<ProdutosSubCategoria> produtosSubCategorias;

    factory CategoryModel.fromJson(String str) => CategoryModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        nome: json["nome"],
        produtosSubCategorias: List<ProdutosSubCategoria>.from(json["produtos_sub_categorias"].map((x) => ProdutosSubCategoria.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "produtos_sub_categorias": List<dynamic>.from(produtosSubCategorias.map((x) => x.toMap())),
    };
}

class ProdutosSubCategoria {
    ProdutosSubCategoria({
        required this.id,
        required this.nome,
        required this.categoriaId,
    });

    final int id;
    final String nome;
    final int categoriaId;

    factory ProdutosSubCategoria.fromJson(String str) => ProdutosSubCategoria.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProdutosSubCategoria.fromMap(Map<String, dynamic> json) => ProdutosSubCategoria(
        id: json["id"],
        nome: json["nome"],
        categoriaId: json["categoria_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "categoria_id": categoriaId,
    };
}
