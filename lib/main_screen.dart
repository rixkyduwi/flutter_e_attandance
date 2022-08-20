import 'package:flutter/material.dart';
 
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset('images/farm-house.jpg'),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text(
                      'Farm House Lembang',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Lembang'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}