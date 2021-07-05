import 'package:get/get.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/network_response_model.dart';
import 'package:rosso_website/models/product_model.dart';

enum Status { LOADING, ERROR, SUCCESS,}

class ProductController {
  final db = Get.find<IDatabase>();
  NetworkResponseModel response =
      NetworkResponseModel(data: "", error: "", count: 0);
  Status productStatus = Status.LOADING;
  late ProductModel produto;

  Future<void> getProduct(int id) async {
    response = await db.getProduct(id);
    if (response.error.isEmpty) {
      if(response.data != "")
      produto = response.data;
      productStatus = Status.SUCCESS;
    } else
      productStatus = Status.ERROR;
  }
}
