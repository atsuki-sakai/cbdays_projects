import 'package:cbdyas_project/screens/utils/privacy_policy_page.dart';
import 'package:cbdyas_project/screens/settings/loagin_page.dart';
import 'package:flutter/material.dart';
import 'screens/settings/firebase_initialized_builder.dart';
import 'screens/settings/main_page.dart';
import 'screens/settings/snapshot_error_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirebaseInitializedBuilder(
      errorPage: SnapShotErrorPage(),
      successPage: MainPage(),
      loadingPage: loadingPage(),
    );
  }
}
