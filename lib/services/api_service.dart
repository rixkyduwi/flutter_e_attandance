// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_e_attandance/constant.dart';
import 'package:flutter_e_attandance/model/user_model.dart';
import 'package:http/http.dart' as http;

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
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}