import 'package:flutter/material.dart';
import 'package:flutter_app1/modules/http.dart';
import 'login_success.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String response = "";

  loginUser() async {
    final result = await http_post("login_", {
      "username": usernameController.text,
      "password": passwordController.text,
    });

    if (result.ok) {
      setState(() {
        response = result.data['ResponseFromNodeJsToFlutter'];
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginSuccess0()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login (Flutter-NodeJs-MySql)")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username1',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password1',
              ),
            ),
          ),
          ElevatedButton(
            child: Text("LOGIN1"),
            onPressed: loginUser,
          ),
          Text(response.toString()),
        ],
      ),
    );
  }
}
