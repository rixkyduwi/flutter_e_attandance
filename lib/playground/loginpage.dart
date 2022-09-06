import 'package:flutter/material.dart';
import 'package:flutter_e_attandance/playground/dashboard.dart';
import 'package:flutter_e_attandance/playground/second_screen.dart';

TextEditingController _controller = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    String _name;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
        child: Card(
        borderOnForeground: true,
        child: ListView(
          children: [
            const Text("Login"),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Write your name here...',
                labelText: 'Your Name',
              ),
            ),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text("Submit"),
            )
          ],
        ),
      )
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
