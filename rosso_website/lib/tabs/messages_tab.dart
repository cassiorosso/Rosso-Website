import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosso_website/controllers/messages_tab_controller.dart';
import 'package:rosso_website/widgets/message_widget.dart';
import 'package:rosso_website/widgets/paginate_widget.dart';

class MessagesTab extends StatefulWidget {
  @override
  _MessagesTabState createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab> {
  final _controller = Get.find<MessagesTabController>();

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    final Function jumToTop = () {
      setState(() {
        if (_scrollController.hasClients)
          _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      });
    };

    return Container(
      child: Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Obx(() {
            if (_controller.messageStatus == Status.LOADING ||
                _controller.messageStatus == Status.IDLE)
              return Container(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            else if (_controller.messageStatus == Status.ERROR)
              return Center(
                child: Container(
                  child: Text("Erro -> ${_controller.response.error}"),
                ),
              );
            else
              return Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _controller.messages.length,
                    itemBuilder: (context, index) {
                      return MessageWidget(
                          message: _controller.messages[index], readMessage: _controller.readMessage);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PaginateWidget(
                      currentPage: _controller.currentPage,
                      pages: _controller.pages,
                      changePage: _controller.changePage,
                      jumpToTop: jumToTop)
                ],
              );
          }),
        ),
      ),
    );
  }
}
