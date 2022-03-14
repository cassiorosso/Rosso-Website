import 'package:get/get.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/banner_model.dart';
import 'package:rosso_website/models/network_response_model.dart';

class HomeController extends GetxController {
  final db = Get.find<IDatabase>();
  NetworkResponseModel response =
      NetworkResponseModel(data: "", error: "", count: 0);
  RxList<BannerModel> banners = <BannerModel>[].obs;

  HomeController() {
    getBanners();
  }

  getBanners() async {
    response = await db.getBanners();
    if (response.error == "") {
      banners.assignAll(response.data);
    }
  }
}
