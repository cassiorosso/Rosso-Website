import 'package:flutter/material.dart';
import 'package:rosso_website/models/message_model.dart';
import 'package:rosso_website/utils/scree_size.dart';

class MessageWidget extends StatelessWidget {
  final size = ScreenSize();
  final MessageModel message;
  final Function readMessage;

  MessageWidget({Key? key, required this.message, required this.readMessage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      color: message.lido == true ? Colors.grey[200] : Colors.white,
      child: ExpansionTile(
        onExpansionChanged: (_){
            if (message.lido == false) {
              readMessage(message.id);
            }
          },
        title: ListTile(
          title: Text(
            message.nome,
            style: TextStyle(
                fontWeight:
                    message.lido == true ? FontWeight.normal : FontWeight.bold, fontSize: 22),
          ),
          subtitle: Text("${message.email}\n${message.telefone}"),
          leading: Icon(message.lido == true
              ? Icons.mark_email_read_rounded
              : Icons.mark_email_unread_rounded),
        ),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            alignment: Alignment.centerLeft,
            child: Text(
              "\n${message.mensagem}",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight:
                    message.lido == true ? FontWeight.normal : FontWeight.bold, fontSize: 18)
            ),
          ),
        ],
      ),
    );
  }
}
