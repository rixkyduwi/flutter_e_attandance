import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_e_attandance/playground/dashboard.dart';
import 'package:flutter_e_attandance/model/user_model.dart';
import 'package:flutter_e_attandance/services/api_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final TextEditingController _controllernip = TextEditingController();
  final TextEditingController _controllerpswd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Login Page'),
            ),
            body: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: _controllernip,
                        decoration:
                            const InputDecoration(hintText: 'Enter NIP'),
                      ),
                      TextField(
                        controller: _controllerpswd,
                        decoration:
                            const InputDecoration(hintText: 'Enter Password'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const dashboard(
                                        title: "dashboard",
                                      )));
                        },
                        child: const Text('Login'),
                      ),
                    ]))));
  }
}
