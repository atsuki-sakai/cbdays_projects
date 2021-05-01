import 'package:cbdyas_project/components/show_alert.dart';
import 'package:cbdyas_project/helper/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

void exceptionHandler(BuildContext context, {required Object exception}) {
  print(1);
  if (exception is CustomException) {
    print(2);
    // FIXME - 別ファイルから呼ぶと動かない。
    showAlertDialog(context,
        code: exception.code,
        content: exception.message,
        defaultActionText: 'OK');
  } else if(exception is FirebaseAuthException) {
    print(3);
    showAlertDialog(context,
        code: exception.code,
        content: exception.message ?? 'No message...',
        defaultActionText: 'OK');
  }else if(exception is FirebaseException) {
    print(4);
    showAlertDialog(context,
        code: exception.code,
        content: exception.message ?? 'No message...',
        defaultActionText: 'OK');
  }else{
    print(5);
    if (exception.toString() is String) {
      print('Exception Type => ${exception.runtimeType}');
      print(exception.toString());
    } else {
      print('Exception Type => ${exception.runtimeType}');
      print(exception);
    }
  }
}
