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

  toastification.show(
    title: Text(
      text,
      maxLines: 20,
    ),
    type: tType,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 5),
  );
}