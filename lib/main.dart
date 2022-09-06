import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_e_attandance/model/login_model.dart';
import 'package:flutter_e_attandance/profilepage.dart';
import 'package:flutter_e_attandance/historypage.dart';
import 'package:flutter_e_attandance/services/api_service.dart';

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
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late final DataLogin datalo;
  late String tokenn;
  void _getToken(String token) async {
    tokenn = token;
    ApiService().createAlbum(_controllernip.text, _controllerpswd.text);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Absensi',
      style: optionStyle,
    ),
    Text(
      'Index 1: Absensi',
      style: optionStyle,
    ),
    Text(
      'Index 2',
      style: optionStyle,
    ),
    
  ];
  
  Widget elementA(int index, String token) {
    if (_selectedIndex == 0) {
      return const HistoryPage();
    } else if (_selectedIndex == 1) {
      return const Text(
        'Index 1: Absensi',
        style: optionStyle,
      );
    } else if (_selectedIndex == 2) {
      return ProfilePage(token: token);
    } else {
      return _widgetOptions.elementAt(_selectedIndex);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool loginsukses = false;
  @override
  Widget build(BuildContext context) {
    print(loginsukses);
    return (_futureAlbum == null)
            ? MaterialApp(
                title: 'Login',
                home: Scaffold(
                  appBar: AppBar(
                    title: const Text('Login Page'),
                  ),
                  body: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10.0),
                    child: buildColumn(""),
                  ),
                ))
            :  MaterialApp(
            title: 'Login',
            home: Scaffold(
                appBar: AppBar(
                  title: const Text('Login Page'),
                ),
                body: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  child: buildFutureBuilder(),
                ),
                bottomNavigationBar: (_futureAlbum == null)? buildFutureBuilder():BottomNavigationBar(
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
        TextFormField(
          controller: _controllerpswd,
          decoration: const InputDecoration(hintText: 'Enter Password'),
        ),
        Container(
            margin: const EdgeInsets.all(15.0),
            height: 60, //height of button
            width: 300, //width of button
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 199, 122, 6), //background color of button
                    // side: BorderSide(width:3, color:Colors.brown), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10) //content padding inside button

                    ),
                onPressed: () {
                  setState(() {
                    _futureAlbum = ApiService()
                        .createAlbum(_controllernip.text, _controllerpswd.text);
                  });
                },
                child: Text("Login")))
      ],
    );
  }

  FutureBuilder<login> buildFutureBuilder() {
    return FutureBuilder<login>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          loginsukses = true;
          print(snapshot.data!.msg);
          print(snapshot.data!.token);
          tokenn = snapshot.data!.token;
          return elementA(_selectedIndex, tokenn);
        } else if (snapshot.hasError) {
          _futureAlbum = null;
          return buildColumn('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
