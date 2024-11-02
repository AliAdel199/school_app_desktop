import 'package:flutter/material.dart';
import 'package:school_app_desktop/pages/home_page.dart';

import 'pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Flutter Desktop Login',debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Tajawal', 
      ),
      home: LoginScreen(),
    );
  }
}
