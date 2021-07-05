import 'package:get/get.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/network_response_model.dart';
import 'package:rosso_website/models/product_model.dart';
import 'package:rosso_website/stores/categories_store.dart';

enum Status { LOADING, ERROR, SUCCESS, IDLE }

class ProductsController extends GetxController {
  final db = Get.find<IDatabase>();
  final categoriesStore = Get.find<CategoriesStore>();
  NetworkResponseModel response =
      NetworkResponseModel(data: "", error: "", count: 0);
  Rx<Status> productStatus = Status.IDLE.obs;
  List<ProductModel> spottedProducts = <ProductModel>[].obs;
  List<ProductModel> products = <ProductModel>[];
  String typesProductsRequest = "";
  String searchStorage = "";
  String textInfo = "Produtos";
  int subCategoryId = 0;
  int currentPage = 1;
  final int limit = 27;
  int offset = 0;
  int pages = 0;
  bool firstLoading = false;

  Future<void> getProducts(bool newRequest) async {
    firstLoading = true;
    productStatus.value = Status.LOADING;
    if (newRequest == true) offset = 0;
    response = await db.getProducts(limit, offset);
    if (response.error.isEmpty) {
      pages = (response.count / limit).ceil();
      currentPage = ((offset / limit) + 1).toInt();
      products.assignAll(response.data);
      products.removeWhere((element) => element.visivel == false);
      typesProductsRequest = "Geral";
      productStatus.value = Status.SUCCESS;
    } else
      productStatus.value = Status.ERROR;
  }

  Future<void> searchProduct(String search, bool newRequest) async {
    typesProductsRequest = "Pesquisa";
    productStatus.value = Status.LOADING;
    searchStorage = search;
    if (newRequest == true) offset = 0;
    response = await db.searchProduct(limit, offset, search);
    if (response.error.isEmpty) {
      pages = (response.count / limit).ceil();
      currentPage = ((offset / limit) + 1).toInt();
      products.assignAll(response.data);
      products.removeWhere((element) => element.visivel == false);
      textInfo = "Produtos encontrados '${search.replaceAll('%', ' ').trim()}': ${response.count}";
      productStatus.value = Status.SUCCESS;
    } else
      productStatus.value = Status.ERROR;
  }

  Future<void> getProductsBySubCategory(bool newRequest) async {
    productStatus.value = Status.LOADING;
    for (int i = 0; i < categoriesStore.allCategories.length; i++) {
      categoriesStore.allCategories[i].produtosSubCategorias.forEach((element) {
        if (element.id == subCategoryId)
          textInfo = "Categoria: ${categoriesStore.allCategories[i].nome} > ${element.nome}";
      });
    }
    if (newRequest == true) offset = 0;
    response = await db.getProductBySubCategory(limit, offset, subCategoryId);
    if (response.error.isEmpty) {
      pages = (response.count / limit).ceil();
      currentPage = ((offset / limit) + 1).toInt();
      products.assignAll(response.data);
      typesProductsRequest = "Categoria";
      productStatus.value = Status.SUCCESS;
    } else
      productStatus.value = Status.ERROR;
  }

  void changePage(int page) async {
    productStatus.value = Status.LOADING;
    offset = limit * (page - 1);
    switch (typesProductsRequest) {
      case "Geral":
        getProducts(false);
        break;
      case "Pesquisa":
        searchProduct(searchStorage, false);
        break;
      case "Categoria":
        getProductsBySubCategory(false);
        break;
    }
  }

  Future<void> getSpotLightProducts() async {
    productStatus.value = Status.LOADING;
    response = await db.getSpotLightProducts();
    if (response.error.isEmpty) {
      spottedProducts.assignAll(response.data);
      productStatus.value = Status.ERROR;
    }
    productStatus.value = Status.SUCCESS;
  }
}
