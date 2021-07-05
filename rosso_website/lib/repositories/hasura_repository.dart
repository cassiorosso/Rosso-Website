import 'package:hasura_connect/hasura_connect.dart';
import 'package:rosso_website/docs/hasura_docs.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/category_model.dart';
import 'package:rosso_website/models/message_model.dart';
import 'package:rosso_website/models/network_response_model.dart';
import 'package:rosso_website/models/product_model.dart';

class HasuraRepository implements IDatabase {
  final HasuraConnect _hasuraConnect;
  final HasuraDocs _hasuraDocs;

  HasuraRepository(this._hasuraConnect, this._hasuraDocs) {
  }

  @override
  Future<NetworkResponseModel> sendMessage(MessageModel message) async {
    NetworkResponseModel response =
        NetworkResponseModel(error: "", data: "", count: 0);

    try {
      final snapshot = await _hasuraConnect
          .mutation(_hasuraDocs.sendMessageMutation, variables: {
        "nome": message.nome,
        "email": message.email,
        "telefone": message.telefone,
        "mensagem": message.mensagem
      });
      response.data =
          snapshot["data"]["insert_website_db_mensagens"]["returning"][0]["id"];
      return response;
    } on Exception catch (e) {
      print(e.toString());
      response.error = "${e.toString()}";
      return response;
    }
  }

  @override
  Future<NetworkResponseModel> getMessages(int limit, int offset) async {
    NetworkResponseModel response =
        NetworkResponseModel(error: "", data: "", count: 0);

    try {
      final snapshot =
          await _hasuraConnect.query(_hasuraDocs.queryMessages, variables: {
        "limit": limit,
        "offset": offset,
      });
      List<MessageModel> messages = List.generate(
          snapshot["data"]["website_db_mensagens"].length,
          (index) => MessageModel.fromMap(
              snapshot["data"]["website_db_mensagens"][index]));
      response.data = messages;
      response.count = snapshot["data"]["website_db_mensagens_aggregate"]
          ["aggregate"]["count"];
      return response;
    } on Exception catch (e) {
      print(e.toString());
      response.error = "${e.toString()}";
      return response;
    }
  }

  @override
  Future<NetworkResponseModel> getAllCategories() async {
    NetworkResponseModel response =
        NetworkResponseModel(error: "", data: "", count: 0);

    try {
      final snapshot = await _hasuraConnect.query(_hasuraDocs.categoriesQuery);
      List<CategoryModel> allCategoriesAndSubCategories = List.generate(
          snapshot["data"]["website_db_produtos_categorias"].length,
          (index) => CategoryModel.fromMap(
              snapshot["data"]["website_db_produtos_categorias"][index]));
      response.data = allCategoriesAndSubCategories;
      return response;
    } on Exception catch (e) {
      print(e.toString());
      response.error = "${e.toString()}";
      return response;
    }
  }

  @override
  Future<NetworkResponseModel> getProducts(int limit, int offset) async {
    NetworkResponseModel response =
        NetworkResponseModel(error: "", data: "", count: 0);

    try {
      final snapshot =
          await _hasuraConnect.query(_hasuraDocs.productsQuery, variables: {
        "limit": limit,
        "offset": offset,
      });
      List<ProductModel> produtos = [];
      for (int i = 0; i < snapshot["data"]["website_db_produtos"].length; i++) {
        produtos.add(
            ProductModel.fromMap(snapshot["data"]["website_db_produtos"][i]));
      }

      response.data = produtos;
      response.count = snapshot["data"]["website_db_produtos_aggregate"]
          ["aggregate"]["count"];
      return response;
    } on Exception catch (e) {
      print(e.toString());
      response.error = "${e.toString()}";
      return response;
    }
  }

  @override
  Future<NetworkResponseModel> searchProduct(
      int limit, int offset, String search) async {
    NetworkResponseModel response =
        NetworkResponseModel(error: "", data: "", count: 0);

    try {
      final snapshot =
          await _hasuraConnect.query(_hasuraDocs.searchNameQuery, variables: {
        "limit": limit,
        "offset": offset,
        "_ilike": search,
      });
      List<ProductModel> produtos = [];
      for (int i = 0; i < snapshot["data"]["website_db_produtos"].length; i++) {
        produtos.add(
            ProductModel.fromMap(snapshot["data"]["website_db_produtos"][i]));
      }
      response.count = snapshot["data"]["website_db_produtos_aggregate"]
          ["aggregate"]["count"];

      if (snapshot["data"]["website_db_produtos"].length < limit) {
        final snapshot2 = await _hasuraConnect
            .query(_hasuraDocs.searchDescriptionQuery, variables: {
          "limit": limit - snapshot["data"]["website_db_produtos"].length,
          "offset": offset,
          "_ilike": search,
        });
        for (int i = 0;
            i < snapshot2["data"]["website_db_produtos"].length;
            i++) {
          produtos.add(ProductModel.fromMap(
              snapshot2["data"]["website_db_produtos"][i]));
        }
        response.count = snapshot["data"]["website_db_produtos_aggregate"]
          ["aggregate"]["count"] + snapshot2["data"]["website_db_produtos_aggregate"]
            ["aggregate"]["count"];
      }
      response.data = produtos;
      return response;
    } on Exception catch (e) {
      print(e.toString());
      response.error = "${e.toString()}";
      return response;
    }
  }

  @override
  Future<NetworkResponseModel> getProductBySubCategory(
      int limit, int offset, int subCategoryId) async {
    NetworkResponseModel response =
        NetworkResponseModel(error: "", data: "", count: 0);

    try {
      final snapshot = await _hasuraConnect.query(
          _hasuraDocs.productsBySubCategoryQuery,
          variables: {"limit": limit, "offset": offset, "_eq": subCategoryId});

      List<ProductModel> productsBySubCategory = [];
      for (int i = 0; i < snapshot["data"]["website_db_produtos"].length; i++) {
        productsBySubCategory.add(
            ProductModel.fromMap(snapshot["data"]["website_db_produtos"][i]));
      }
      response.data = productsBySubCategory;
      response.count = snapshot["data"]["website_db_produtos_aggregate"]
          ["aggregate"]["count"];
      return response;
    } on Exception catch (e) {
      print(e.toString());
      response.error = "${e.toString()}";
      return response;
    }
  }

  @override
  Future<NetworkResponseModel> getSpotLightProducts() async {
    NetworkResponseModel response =
        NetworkResponseModel(error: "", data: "", count: 0);

    try {
      final snapshot =
          await _hasuraConnect.query(_hasuraDocs.spotLightProducts);
      List<ProductModel> produtos = [];
      for (int i = 0; i < snapshot["data"]["website_db_produtos"].length; i++) {
        produtos.add(
            ProductModel.fromMap(snapshot["data"]["website_db_produtos"][i]));
      }
      response.data = produtos;
      return response;
    } on Exception catch (e) {
      print(e.toString());
      response.error = "${e.toString()}";
      return response;
    }
  }

  @override
  Future<NetworkResponseModel> login(
      {required String email, required String password}) async {
    NetworkResponseModel response =
        NetworkResponseModel(error: "", data: "", count: 0);

    try {
      _hasuraConnect.headers!.addAll({
        "x-hasura-editor-email": email,
        "x-hasura-editor-token": password,
      });

      final snapshot = await _hasuraConnect.query(
        _hasuraDocs.loginQuery,
      );

      response.data = snapshot["data"]["website_db_usuarios"];

      if (response.data.isEmpty) {
        response.error = "Usuário ou senha incorretos!";
        _hasuraConnect.headers!.remove("x-hasura-editor-email");
        _hasuraConnect.headers!.remove("x-hasura-editor-token");
      }
      return response;
    } on Exception catch (e) {
      print(e.toString());
      response.error = "${e.toString()}";
      return response;
    }
  }

  @override
  Future<bool> readMessage(int id) async {
    try {
      await _hasuraConnect
          .mutation(_hasuraDocs.updateReadMessage, variables: {"_eq": id});
      return true;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<bool> updateProduct(ProductModel product) async {
    try {
      await _hasuraConnect.mutation(_hasuraDocs.updateProduct, variables: {
        "id": product.id,
        "categoria_id": product.categoriaId,
        "sub_categoria_id": product.subCategoriaId,
        "visivel": product.visivel,
        "destaque": product.destaque
      });
      return true;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<bool> insertImageUrl(int productId, String url) async {
    try {
      await _hasuraConnect.mutation(_hasuraDocs.insertImageUrl,
          variables: {"produto_id": productId, "url": url});
      return true;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteImageUrl(String url) async {
    try {
      await _hasuraConnect
          .mutation(_hasuraDocs.deleteImage, variables: {"_eq": url});
      return true;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<NetworkResponseModel> getProduct(int productId) async {
    NetworkResponseModel response =
        NetworkResponseModel(error: "", data: "", count: 0);
    try {
      final snapshot =
          await _hasuraConnect.query(_hasuraDocs.productQuery, variables: {
        "_id": productId,
      });
      if (snapshot["data"]["website_db_produtos"].length != 0) {
        ProductModel produto =
            ProductModel.fromMap(snapshot["data"]["website_db_produtos"][0]);
        response.data = produto;
      }
      return response;
    } on Exception catch (e) {
      print(e.toString());
      response.error = "${e.toString()}";
      return response;
    }
  }
}
