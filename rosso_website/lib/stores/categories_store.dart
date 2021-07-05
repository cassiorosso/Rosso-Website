import 'package:get/get.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/category_model.dart';
import 'package:rosso_website/models/network_response_model.dart';

class CategoriesStore extends GetxController {
  final db = Get.find<IDatabase>();
  List<CategoryModel> allCategories = <CategoryModel>[].obs;
  NetworkResponseModel responseAllCategories =
      NetworkResponseModel(data: "", error: "", count: 0);

  CategoriesStore() {
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    responseAllCategories = await db.getAllCategories();
    if (responseAllCategories.error.isEmpty)
      allCategories.addAll(responseAllCategories.data);
  }
}
