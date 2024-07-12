import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

FToast fToast=FToast();



showToast(context,text) {
  fToast.init(context);

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.grey[600],

    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text,style: const TextStyle(color: Colors.white),),
      ],
    ),
  );


  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 3),
  );

  // Custom Toast Position
  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 7),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 16.0,
          left: 16.0,
          child: child,
        );
      });
}