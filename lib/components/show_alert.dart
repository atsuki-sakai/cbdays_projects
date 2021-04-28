import 'dart:io';

import 'package:cbdyas_project/constants/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Future<bool?> showAlertDialog(BuildContext context,
    {required String title,
    required String message,
    required String actionButtonText,
    String? cancelButtonText}) async {
  if (!Platform.isIOS) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(actionButtonText)),
              if (cancelButtonText != null) ...{
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(cancelButtonText),
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
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(actionButtonText)),
              if (cancelButtonText != null) ...{
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(cancelButtonText),
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

