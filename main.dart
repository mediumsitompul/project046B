import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/login_page.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter NodeJS",
      home: LoginPage(), //class LoginPage extends StatefulWidget, on file pages/login_page.dart
    );
  }
}
