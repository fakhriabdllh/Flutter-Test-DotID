import 'package:dot_indonesia/controller/controller_bindings.dart';
import 'package:dot_indonesia/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'DOT-ID',
        debugShowCheckedModeBanner: false,
        initialBinding: ControllerBindings(),
        home: const LoginView());
  }
}
