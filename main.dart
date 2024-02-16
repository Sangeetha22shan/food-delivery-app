import 'package:flutter/material.dart';
import 'package:food_delivery_app/DrawerMenu.dart';
import 'Login_screen.dart';
import 'home_screen.dart';
import 'constants.dart';

void main() {
  runApp(FoodLogin());
}

class FoodLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
