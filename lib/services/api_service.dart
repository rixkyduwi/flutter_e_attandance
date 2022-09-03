// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_e_attandance/constant.dart';
import 'package:flutter_e_attandance/model/user_model.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class ApiService {
  /*Future getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body.toString());
        UserModel model = UserModel.fromJson(jsonData);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }*/
  Future<login> createAlbum(String nip, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.30.239:5001/api/login/karyawan'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nip': nip,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      print(response.body.toString());
      final jsonData = jsonDecode(response.body.toString());
      return login.fromJson(jsonData);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future<List<UserModel>?> getHistoryabsen() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.historyabsen);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body.toString());
        print(jsonData[0]["msg"]);
        List<UserModel> _model =
            userModelFromJson(jsonEncode(jsonData[0]["data"]).toString());
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<UserModel>?> getHistorypulang() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.historypulang);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body.toString());
        print(jsonData[0]["msg"]);
        List<UserModel> _model =
            userModelFromJson(jsonEncode(jsonData[0]["data"]).toString());
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
