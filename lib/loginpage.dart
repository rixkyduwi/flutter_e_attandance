import 'package:flutter/material.dart';
import 'package:flutter_e_attandance/dashboard.dart';
import 'package:flutter_e_attandance/second_screen.dart';

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
      body: Center(
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const dashboard(title: "dashboard",)));
              },
              child: const Text("Submit"),
            )
          ],
        ),
      )),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
