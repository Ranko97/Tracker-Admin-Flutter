// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';

import 'package:dipl_admin/locations/location_model.dart';
import 'package:dipl_admin/orders/order_model.dart';

class CourierModel {
  final String id;
  final String username;
  final String fullName;
  final String phoneNumber;
  final int deliveredOrdersCount;
  final double averageRating;
  final Decimal earningsToday;
  final Decimal earningsTotal;
  final String earningsCurrency;
  final List<OrderModel>? orders;
  final LocationModel? lastLocation;

  CourierModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.phoneNumber,
    required this.deliveredOrdersCount,
    required this.averageRating,
    required this.earningsToday,
    required this.earningsTotal,
    required this.earningsCurrency,
    this.orders,
    this.lastLocation,
  });

  CourierModel copyWith({
    String? id,
    String? username,
    String? fullName,
    String? phoneNumber,
    int? deliveredOrdersCount,
    double? averageRating,
    Decimal? earningsToday,
    Decimal? earningsTotal,
    String? earningsCurrency,
    List<OrderModel>? orders,
    LocationModel? lastLocation,
  }) {
    return CourierModel(
      id: id ?? this.id,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      deliveredOrdersCount: deliveredOrdersCount ?? this.deliveredOrdersCount,
      averageRating: averageRating ?? this.averageRating,
      earningsToday: earningsToday ?? this.earningsToday,
      earningsTotal: earningsTotal ?? this.earningsTotal,
      earningsCurrency: earningsCurrency ?? this.earningsCurrency,
      orders: orders ?? this.orders,
      lastLocation: lastLocation ?? this.lastLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'deliveredOrdersCount': deliveredOrdersCount,
      'averageRating': averageRating,
      'earningsToday': earningsToday.toJson(),
      'earningsTotal': earningsTotal.toJson(),
      'earningsCurrency': earningsCurrency,
      'orders': orders?.map((x) => x.toMap()).toList(),
      'lastLocation': lastLocation?.toMap(),
    };
  }

  factory CourierModel.fromMap(Map<String, dynamic> map) {
    return CourierModel(
      id: map['id'] as String,
      username: map['username'] as String,
      fullName: map['fullName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      deliveredOrdersCount: map['deliveredOrdersCount'] as int,
      averageRating: map['averageRating'] as double,
      earningsToday: Decimal.fromJson(map['earningsToday']),
      earningsTotal: Decimal.fromJson(map['earningsTotal']),
      earningsCurrency: map['earningsCurrency'] as String,
      orders: map['orders'] != null
          ? List<OrderModel>.from(
              (map['orders']).map<OrderModel?>(
                (x) => OrderModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      lastLocation: map['lastLocation'] != null
          ? LocationModel.fromMap(map['lastLocation'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourierModel.fromJson(String source) =>
      CourierModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourierModel(id: $id, username: $username, fullName: $fullName, phoneNumber: $phoneNumber, deliveredOrdersCount: $deliveredOrdersCount, averageRating: $averageRating, earningsToday: $earningsToday, earningsTotal: $earningsTotal, earningsCurrency: $earningsCurrency, orders: $orders, lastLocation: $lastLocation)';
  }

  @override
  bool operator ==(covariant CourierModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.deliveredOrdersCount == deliveredOrdersCount &&
        other.averageRating == averageRating &&
        other.earningsToday == earningsToday &&
        other.earningsTotal == earningsTotal &&
        other.earningsCurrency == earningsCurrency &&
        listEquals(other.orders, orders) &&
        other.lastLocation == lastLocation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        fullName.hashCode ^
        phoneNumber.hashCode ^
        deliveredOrdersCount.hashCode ^
        averageRating.hashCode ^
        earningsToday.hashCode ^
        earningsTotal.hashCode ^
        earningsCurrency.hashCode ^
        orders.hashCode ^
        lastLocation.hashCode;
  }
}
