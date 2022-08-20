// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_e_attandance/second_screen.dart';

class SplashScreen extends StatelessWidget {
  final List<int> numberList = [1, 2, 3, 4, 5, 6, 7, 8];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();//-\-/-\-/
        },
      ),
    );
  }
}

Future<String> getOrder() {
  return Future.delayed(const Duration(seconds: 3), () {
    var isStockAvailable = true;
    if (isStockAvailable) {
      return 'welcome';
    } else {
      throw 'waiting..';
    }
  });
}
