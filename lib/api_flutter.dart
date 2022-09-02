import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_e_attandance/model/user_model.dart';
import 'package:flutter_e_attandance/services/api_service.dart';
import 'package:http/http.dart' as http;

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
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter NIP'),
        ),
        TextField(
          restorationId: "pswd",
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Password'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = ApiService().createAlbum(_controller.text,_controller.text);
            });
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(snapshot.data!.data.nip),
                Text(snapshot.data!.data.nama),
                Text(snapshot.data!.data.email),
                Text(snapshot.data!.data.gender),
                Text(snapshot.data!.data.posisi),
                Text(snapshot.data!.data.no_hp),
                Text(snapshot.data!.data.ttl),
                ]
              );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
