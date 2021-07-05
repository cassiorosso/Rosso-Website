import 'package:flutter/material.dart';

loadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => Center(
            child: AlertDialog(
              title: Text(
                "Carregando...",
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                height: 60,
                width: 60,
                child: Center(child: CircularProgressIndicator()),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ));
}
