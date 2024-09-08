import 'dart:convert';

import 'package:dipl_admin/api_config.dart';
import 'package:dipl_admin/couriers/courier_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CourierService {
  Future<List<CourierModel>?> getCouriers() async {
    try {
      final response = await http.get(
        Uri.parse("${ApiConfig.baseUrl}/Couriers"),
        headers: ApiConfig.authHeaders,
      );
      return List<CourierModel>.from(
        (json.decode(response.body)).map<CourierModel?>(
          (x) => CourierModel.fromMap(x as Map<String, dynamic>),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }
}
