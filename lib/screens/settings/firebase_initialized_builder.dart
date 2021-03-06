import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseInitializedBuilder extends StatelessWidget {
  final Widget errorPage;
  final Widget successPage;
  final Widget loadingPage;
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  FirebaseInitializedBuilder(
      {Key? key,required this.errorPage,required this.successPage,required this.loadingPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return errorPage;
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return successPage;
        }
        return loadingPage;
      },
    );
  }
}
