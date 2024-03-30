import 'package:flutter/material.dart';
//função que chama a snackBar 

showSnackBar({required BuildContext context, required String text, bool isErro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    backgroundColor: isErro ? Colors.red : Colors.green,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    duration: const Duration(seconds: 5),
    action: SnackBarAction(
      label: "OK",
      textColor: Colors.white,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    )
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
