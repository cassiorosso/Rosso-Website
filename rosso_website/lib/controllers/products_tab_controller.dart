import 'package:get/get.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/network_response_model.dart';
import 'package:rosso_website/models/product_model.dart';
import 'dart:html';
import 'package:firebase/firebase.dart' as fb;

enum Status { LOADING, ERROR, SUCCESS, IDLE }

class ProductsTabController extends GetxController {
  final int limit = 25;
  int offset = 0;
  final db = Get.find<IDatabase>();
  NetworkResponseModel response =
      NetworkResponseModel(data: "", error: "", count: 0);
  Rx<Status> productsStatus = Status.IDLE.obs;
  List<ProductModel> products = <ProductModel>[];
  int currentPage = 1;
  int pages = 0;
  bool alreadyConnected = false;
  String searchStorage = "";
  String typesProductsRequest = "";

  ProductsTabController() {
    getProducts(true);
  }

  void getProducts(bool newRequest) async {
    productsStatus.value = Status.LOADING;
    if (newRequest == true) offset = 0;
    response = await db.getProducts(limit, offset);
    if (response.error.isEmpty) {
      pages = (response.count / limit).ceil();
      currentPage = ((offset / limit) + 1).toInt();
      products = response.data;
      typesProductsRequest = "Geral";
      productsStatus.value = Status.SUCCESS;
    } else
      productsStatus.value = Status.ERROR;
    alreadyConnected = true;
  }

  void getCategory(bool newRequest)async{
        productsStatus.value = Status.LOADING;
    if (newRequest == true) offset = 0;
    response = await db.getProductBySubCategory(limit, offset, 1);
    if (response.error.isEmpty) {
      pages = (response.count / limit).ceil();
      currentPage = ((offset / limit) + 1).toInt();
      products = response.data;
      typesProductsRequest = "Categoria";
      productsStatus.value = Status.SUCCESS;
    } else
      productsStatus.value = Status.ERROR;
  }

  Future<void> searchProduct(String search, bool newRequest) async {
    productsStatus.value = Status.LOADING;
    searchStorage = search;
    if (newRequest == true) offset = 0;
    response = await db.searchProduct(limit, offset, search);
    if (response.error.isEmpty) {
      pages = (response.count / limit).ceil();
      currentPage = ((offset / limit) + 1).toInt();
      products = response.data;
      //products.assignAll(response.data);
      typesProductsRequest = "Pesquisa";
      productsStatus.value = Status.SUCCESS;
    } else
      productsStatus.value = Status.ERROR;
  }

  //   Future<void> getProductsBySubCategory(bool newRequest) async {
  //   productsStatus.value = Status.LOADING;
  //   if (newRequest == true) offset = 0;
  //   response = await db.getProductBySubCategory(limit, offset, subCategoryId);
  //   if (response.error.isEmpty) {
  //     pages = (response.count / limit).ceil();
  //     currentPage = ((offset / limit) + 1).toInt();
  //     products.assignAll(response.data);
  //     typesProductsRequest = "Categoria";
  //     productStatus.value = Status.SUCCESS;
  //   } else
  //     productStatus.value = Status.ERROR;
  // }

  void changePage(int page) async {
    offset = limit * (page - 1);
    switch (typesProductsRequest) {
      case "Geral":
        getProducts(false);
        break;
      case "Pesquisa":
        searchProduct(searchStorage, false);
        break;
      case "Categoria":
        getCategory(false);
        break;
    }
  }

  Future<bool> updateProduct(ProductModel produto, bool sendToDB) async {
    products.singleWhere((element) => element.id == produto.id).categoriaId =
        produto.categoriaId;
    products.singleWhere((element) => element.id == produto.id).subCategoriaId =
        produto.subCategoriaId;
    products.singleWhere((element) => element.id == produto.id).visivel =
        produto.visivel;
    products.singleWhere((element) => element.id == produto.id).destaque =
        produto.destaque;
    if (sendToDB == true) {
      if (await db.updateProduct(produto) == false) return false;
    }
    productsStatus.value = Status.LOADING;
    productsStatus.value = Status.SUCCESS;
    return true;
  }

  Future<void> updateImageProduct(ProductModel produto, String urlImage) async {
    await db.insertImageUrl(produto.id, urlImage);
    productsStatus.value = Status.LOADING;
    products
        .singleWhere((element) => element.id == produto.id)
        .produtosImagens
        .add(urlImage);
    productsStatus.value = Status.SUCCESS;
  }

  Future<void> uploadImage({required Function(File file) onSelected}) async {
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.accept = 'image/*';
    //InputElement uploadInput = InputElement()..accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
      });
    });
  }

  void uploadToStorage(ProductModel produto) {
    final dateTime = DateTime.now();
    final path = 'produtos/${produto.nome}_$dateTime';
    uploadImage(onSelected: (file) async {
      await fb
          .storage()
          .refFromURL("gs://rosso-website.appspot.com/")
          .child(path)
          .put(file)
          .future
          .then((snapshot) {
        snapshot.ref.getDownloadURL().then((urlImage) {
          updateImageProduct(produto, urlImage.toString());
        });
      });
    });
  }

  void deleteImageFromStorage(String url, int productId) async {
    productsStatus.value = Status.LOADING;
    fb.storage().refFromURL(url).delete();
    db.deleteImageUrl(url);
    products
        .singleWhere((element) => element.id == productId)
        .produtosImagens
        .remove(url);
    productsStatus.value = Status.SUCCESS;
  }
}
