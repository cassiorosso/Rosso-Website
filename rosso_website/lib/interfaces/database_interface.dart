import 'package:rosso_website/models/message_model.dart';
import 'package:rosso_website/models/network_response_model.dart';
import 'package:rosso_website/models/product_model.dart';

abstract class IDatabase {
  Future<NetworkResponseModel> sendMessage(MessageModel message);
  Future<NetworkResponseModel> getAllCategories();
  Future<NetworkResponseModel> getProducts(int limit, int offset);
  Future<NetworkResponseModel> searchProduct(
      int limit, int offset, String search);
  Future<NetworkResponseModel> getProductBySubCategory(
      int limit, int offset, int subCategoryId);
  Future<NetworkResponseModel> getSpotLightProducts();
  Future<NetworkResponseModel> login(
      {required String email, required String password});
  Future<NetworkResponseModel> getMessages(int limit, int offset);
  Future<bool> readMessage(int id);
  Future<bool> updateProduct(ProductModel product);
  Future<bool> insertImageUrl(int productId, String url);
  Future<bool> deleteImageUrl(String url);
  Future<NetworkResponseModel> getProduct(int productId);
  Future<NetworkResponseModel> getDestaqueProducts(int limit, int offset);
  Future<NetworkResponseModel> getNaoVisiveisProducts(int limit, int offset);
  Future<NetworkResponseModel> getEstoqueProducts(int limit, int offset, double estoque);
  Future<NetworkResponseModel> getBanners();

}
