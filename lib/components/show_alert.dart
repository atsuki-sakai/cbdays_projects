import 'dart:io';

import 'package:cbdyas_project/helper/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Future<bool?> showAlertDialog(BuildContext context,
    {required String code,
    required String content,
    required String defaultActionText,
    String? cancelActionText}) async {
  if (!Platform.isIOS) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(code),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(defaultActionText)),
              if (cancelActionText != null) ...{
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(cancelActionText),
                )
              },
            ],
          );
        });
  } else {
    return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(code),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(defaultActionText)),
              if (cancelActionText != null) ...{
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(cancelActionText),
                )
              },
            ],
          );
        });
  }
}

void showExceptionDialog(BuildContext context,
    {required Object exception}) async {

  if (!Platform.isIOS) {
    if (exception is CustomException) {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text(exception.code),
          content: Text('error'),
          actions: [
            TextButton(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context)),
          ]
          ,);
      });
    } else if(exception is FirebaseAuthException) {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text(exception.code),
          content: Text('error'),
          actions: [
            TextButton(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context)),
          ]
          ,);
      });
    }else if(exception is FirebaseException) {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text(exception.code),
          content: Text('error'),
          actions: [
            TextButton(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context)),
          ]
          ,);
      });
    }else{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Error'),
          content: Text('ErrorType => ${exception.runtimeType}'),
          actions: [
            TextButton(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context)),
          ]
          ,);
      });
    }
  } else {

    if (exception is CustomException) {
      showCupertinoDialog(context: context, builder: (context){
        return CupertinoAlertDialog(
          title: Text(exception.code),
          content: Text('error'),
          actions: [
            TextButton(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context)),
          ]
          ,);
      });
    } else if(exception is FirebaseAuthException) {
      showCupertinoDialog(context: context, builder: (context){
        return CupertinoAlertDialog(
          title: Text(exception.code),
          content: Text('error'),
          actions: [
            TextButton(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context)),
          ]
          ,);
      });
    }else if(exception is FirebaseException) {
      showCupertinoDialog(context: context, builder: (context){
        return CupertinoAlertDialog(
          title: Text(exception.code),
          content: Text('error'),
          actions: [
            TextButton(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context)),
          ]
          ,);
      });
    }else{
      showCupertinoDialog(context: context, builder: (context){
        return CupertinoAlertDialog(
          title: Text('Error'),
          content: Text('ErrorType => ${exception.runtimeType}'),
          actions: [
            TextButton(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context)),
          ]
          ,);
      });
    }
  }
}

