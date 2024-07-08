import 'package:flutter/material.dart';

void dialog(
    {required String text,
    required String title,
    required BuildContext context}) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text(
              title,
              // style: TextStyle(color: Colors.white),
            ),
            content: Text(
              text,
              // style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Okay"),
              )
            ],
          ));
}
