import 'package:flutter/material.dart';
import 'screens/loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{},
      home: LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}
