import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xffF5F5F5),
      child: Center(
        child: Image.asset(
          '../assets/logo-dot.png',
          width: width - 100,
        ),
        // child: Container(
        //   width: width,
        //   height: 150,
        //   color: Colors.black,
        // ),
      ),
    ));
  }
}
