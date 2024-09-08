import 'dart:convert';

import 'package:dipl_admin/api_config.dart';
import 'package:dipl_admin/users/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<UserModel>?> getUsers() async {
    try {
      final response = await http.get(
        Uri.parse("${ApiConfig.baseUrl}/users"),
        headers: ApiConfig.authHeaders,
      );
      return List<UserModel>.from(
        (json.decode(response.body)).map<UserModel?>(
          (x) => UserModel.fromMap(x as Map<String, dynamic>),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }
}
