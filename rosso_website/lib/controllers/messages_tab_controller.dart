import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:rosso_website/interfaces/database_interface.dart';
import 'package:rosso_website/models/message_model.dart';
import 'package:rosso_website/models/network_response_model.dart';

enum Status { LOADING, ERROR, SUCCESS, IDLE }

class MessagesTabController extends GetxController {
  final int limit = 25;
  int offset = 0;
  final db = Get.find<IDatabase>();
  NetworkResponseModel response =
      NetworkResponseModel(data: "", error: "", count: 0);
  Rx<Status> messageStatus = Status.IDLE.obs;
  List<MessageModel> messages = <MessageModel>[];
  int currentPage = 1;
  int pages = 0;
  bool alreadyConnected = false;
  late Snapshot snapshot;

  MessagesTabController() {
    getMessages();
  }

  void getMessages() async {
    messageStatus.value = Status.LOADING;
    response = await db.getMessages(limit, offset);
    if (response.error.isEmpty) {
      pages = (response.count / 25).ceil();
      currentPage = ((offset / 25) + 1).toInt();
      messages.assignAll(response.data);
      messageStatus.value = Status.SUCCESS;
    } else
      messageStatus.value = Status.ERROR;
    alreadyConnected = true;
  }

  void changePage(int page) async {
    offset = 25 * (page - 1);
    getMessages();
  }

  void readMessage(int id) {
    messageStatus.value = Status.LOADING;
    messages.singleWhere((element) => element.id == id).lido = true;
    db.readMessage(id);
    messageStatus.value = Status.SUCCESS;
  }
}
