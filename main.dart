import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weblord/controller/auth_controller.dart';
import 'package:weblord/homepage.dart';

import 'package:weblord/pages/admisstion_pages.dart';
import 'package:weblord/pages/contant.dart';
import 'package:weblord/pages/login.dart';

import 'package:weblord/profilepage.dart';
import 'package:weblord/screens/home.screen.dart';

import 'package:weblord/screens/login_screen.dart';

Future<void> main() async {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: authController.tryAutoLogin(),
          builder: (contect, authResult) {
            if (authResult.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
              );
            } else {
              if (authResult.data == true) {
                 return  Homescreen ();
              }
              return  LoginScreen();
            }
          }),
    );
  }
}
