import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

//FToast fToast=FToast();

enum TType {
  info,
  warning,
  success,
  error,
}



showToast(String text, TType type) {

  ToastificationType tType = type == TType.error ? ToastificationType.error : type == TType.info ? ToastificationType.info : type == TType.success ? ToastificationType.success : ToastificationType.warning;

  //fToast.init(context);

  toastification.show(
    title: Text(text),
    type: tType,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 5),
  );

  /*Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.grey[600],

    ),
    child: Column(
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
      });*/
}