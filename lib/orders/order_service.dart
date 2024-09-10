import 'dart:convert';

import 'package:dipl_admin/api_config.dart';
import 'package:dipl_admin/orders/order_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderService {
  static Future<List<OrderModel>?> getOrders() async {
    try {
      final response = await http.get(
        Uri.parse("${ApiConfig.baseUrl}/Orders"),
        headers: ApiConfig.authHeaders,
      );
      return List<OrderModel>.from(
        (json.decode(response.body)).map<OrderModel?>(
          (x) => OrderModel.fromMap(x as Map<String, dynamic>),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }

  static Future<(String?, String?)> addOrder(Map<String, dynamic> order) async {
    try {
      final response = await http.post(
        Uri.parse("${ApiConfig.baseUrl}/Orders/add"),
        headers: {
          "Authorization": ApiConfig.authToken,
          "Content-Type": "application/json-patch+json",
        },
        body: json.encode(order),
      );

      if (response.statusCode == 200) {
        return (
          response.body.isEmpty
              ? "success"
              : OrderModel.fromJson(response.body).id,
          null
        );
      } else {
        return (null, response.body);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return (null, null);
  }
}
