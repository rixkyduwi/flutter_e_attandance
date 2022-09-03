import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_e_attandance/dashboard.dart';
import 'package:flutter_e_attandance/model/user_model.dart';
import 'package:flutter_e_attandance/services/api_service.dart';

import 'historypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controllernip = TextEditingController();
  final TextEditingController _controllerpswd = TextEditingController();
  Future<login>? _futureAlbum;
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late final DataLogin datalo;

  static const List<Widget> _widgetOptions = <Widget>[
    HistoryPage(),
    Text(
      'Index 1: Absensi',
      style: optionStyle,
    ),
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      if (_selectedIndex == 0) {
        HistoryPage();
      } else if (_selectedIndex == 1) {
      } else if (_selectedIndex == 2) {
      }
    });
  }

  bool loginsukses = false;
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
              child: (_futureAlbum == null)
                  ? buildColumn("")
                  : buildFutureBuilder(),
            ),
            bottomNavigationBar: (loginsukses == false)
                ? buildColumn("")
                : BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.history),
                        label: 'History',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.fingerprint),
                        label: 'Absen',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: Colors.amber[800],
                    onTap: _onItemTapped,
                  )));
  }

  Column buildColumn(String e) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(e),
        TextField(
          controller: _controllernip,
          decoration: const InputDecoration(hintText: 'Enter NIP'),
        ),
        TextField(
          controller: _controllerpswd,
          decoration: const InputDecoration(hintText: 'Enter Password'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = ApiService()
                  .createAlbum(_controllernip.text, _controllerpswd.text);
            });
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  FutureBuilder<login> buildFut() {
    return FutureBuilder<login>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            loginsukses = true;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(snapshot.data!.data.nip),
                Text(snapshot.data!.data.nama),
                Text(snapshot.data!.data.posisi),
                Text(snapshot.data!.data.gender),
                Text(snapshot.data!.data.ttl),
                Text(snapshot.data!.data.email),
                Text(snapshot.data!.data.no_hp),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _futureAlbum = null;
                      loginsukses = false;
                    });
                  },
                  child: const Text('Login'),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return buildColumn(snapshot.error.toString());
          }

          return const CircularProgressIndicator();
        });
  }

  FutureBuilder<login> buildFutureBuilder() {
    return FutureBuilder<login>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          loginsukses = true;
          String nip = snapshot.data!.data.nip;
          return _widgetOptions.elementAt(_selectedIndex);
        } else if (snapshot.hasError) {
          return buildColumn(snapshot.error.toString());
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
