
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreService {
  FireStoreService._();
  static final instance = FireStoreService._();

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data);
  }
  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('delete: $path');
    await reference.delete();
  }

  Future<Map<String, dynamic>?> getData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    final snapShot = await reference.get();
    print('snapShot => ${snapShot.data()}');
    return snapShot.data();
}
}
