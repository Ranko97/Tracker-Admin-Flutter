// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dipl_admin/locations/location_model.dart';
import 'package:dipl_admin/orders/order_model.dart';

class UserModel {
  final String id;
  final String username;
  final String phoneNumber;
  final List<OrderModel>? orders;
  final LocationModel? defaultLocation;
  final String address;

  UserModel({
    required this.id,
    required this.username,
    required this.phoneNumber,
    this.orders,
    this.defaultLocation,
    required this.address,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? phoneNumber,
    List<OrderModel>? orders,
    LocationModel? defaultLocation,
    String? address,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      orders: orders ?? this.orders,
      defaultLocation: defaultLocation ?? this.defaultLocation,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'phoneNumber': phoneNumber,
      'orders': orders?.map((x) => x.toMap()).toList(),
      'defaultLocation': defaultLocation?.toMap(),
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      username: map['username'] as String,
      phoneNumber: map['phoneNumber'] as String,
      orders: map['orders'] != null
          ? List<OrderModel>.from(
              (map['orders']).map<OrderModel?>(
                (x) => OrderModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      defaultLocation: map['defaultLocation'] != null
          ? LocationModel.fromMap(
              map['defaultLocation'] as Map<String, dynamic>)
          : null,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, phoneNumber: $phoneNumber, orders: $orders, defaultLocation: $defaultLocation, address: $address)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.phoneNumber == phoneNumber &&
        listEquals(other.orders, orders) &&
        other.defaultLocation == defaultLocation &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        phoneNumber.hashCode ^
        orders.hashCode ^
        defaultLocation.hashCode ^
        address.hashCode;
  }
}
