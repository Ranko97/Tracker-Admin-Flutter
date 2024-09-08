// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:decimal/decimal.dart';

import 'package:dipl_admin/couriers/courier_model.dart';
import 'package:dipl_admin/locations/location_model.dart';
import 'package:dipl_admin/users/user_model.dart';
import 'package:dipl_admin/warehouses/warehouse_model.dart';

class OrderModel {
  final String id;
  final String status;
  final String details;
  final String paymentType;
  final DateTime timeCreated;
  final DateTime? timeDelivered;
  final Decimal courierEarnings;
  final String courierEarningsCurrency;
  final Decimal totalCost;
  final String totalCostCurrency;

  final UserModel? user;
  final WarehouseModel? warehouse;
  final CourierModel? courier;
  final LocationModel? deliveryLocation;

  final String? userID;
  final String? warehouseID;
  final String? courierID;
  final String? deliveryLocationId;

  OrderModel({
    required this.id,
    required this.status,
    required this.details,
    required this.paymentType,
    required this.timeCreated,
    this.timeDelivered,
    required this.courierEarnings,
    required this.courierEarningsCurrency,
    required this.totalCost,
    required this.totalCostCurrency,
    this.user,
    this.warehouse,
    this.courier,
    this.deliveryLocation,
    this.userID,
    this.warehouseID,
    this.courierID,
    this.deliveryLocationId,
  });

  OrderModel copyWith({
    String? id,
    String? status,
    String? details,
    String? paymentType,
    DateTime? timeCreated,
    DateTime? timeDelivered,
    Decimal? courierEarnings,
    String? courierEarningsCurrency,
    Decimal? totalCost,
    String? totalCostCurrency,
    UserModel? user,
    WarehouseModel? warehouse,
    CourierModel? courier,
    LocationModel? deliveryLocation,
    String? userID,
    String? warehouseID,
    String? courierID,
    String? deliveryLocationId,
  }) {
    return OrderModel(
      id: id ?? this.id,
      status: status ?? this.status,
      details: details ?? this.details,
      paymentType: paymentType ?? this.paymentType,
      timeCreated: timeCreated ?? this.timeCreated,
      timeDelivered: timeDelivered ?? this.timeDelivered,
      courierEarnings: courierEarnings ?? this.courierEarnings,
      courierEarningsCurrency:
          courierEarningsCurrency ?? this.courierEarningsCurrency,
      totalCost: totalCost ?? this.totalCost,
      totalCostCurrency: totalCostCurrency ?? this.totalCostCurrency,
      user: user ?? this.user,
      warehouse: warehouse ?? this.warehouse,
      courier: courier ?? this.courier,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      userID: userID ?? this.userID,
      warehouseID: warehouseID ?? this.warehouseID,
      courierID: courierID ?? this.courierID,
      deliveryLocationId: deliveryLocationId ?? this.deliveryLocationId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'details': details,
      'paymentType': paymentType,
      'timeCreated': timeCreated.millisecondsSinceEpoch,
      'timeDelivered': timeDelivered?.millisecondsSinceEpoch,
      'courierEarnings': courierEarnings.toJson(),
      'courierEarningsCurrency': courierEarningsCurrency,
      'totalCost': totalCost.toJson(),
      'totalCostCurrency': totalCostCurrency,
      'user': user?.toMap(),
      'warehouse': warehouse?.toMap(),
      'courier': courier?.toMap(),
      'deliveryLocation': deliveryLocation?.toMap(),
      'userID': userID,
      'warehouseID': warehouseID,
      'courierID': courierID,
      'deliveryLocationId': deliveryLocationId,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      status: map['status'] as String,
      details: map['details'] as String,
      paymentType: map['paymentType'] as String,
      timeCreated: DateTime.parse(map['timeCreated']),
      timeDelivered: map['timeDelivered'] != null
          ? DateTime.parse(map['timeDelivered'])
          : null,
      courierEarnings: Decimal.fromJson(map['courierEarnings']),
      courierEarningsCurrency: map['courierEarningsCurrency'] as String,
      totalCost: Decimal.fromJson(map['totalCost']),
      totalCostCurrency: map['totalCostCurrency'] as String,
      user: map['user'] != null
          ? UserModel.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      warehouse: map['warehouse'] != null
          ? WarehouseModel.fromMap(map['warehouse'] as Map<String, dynamic>)
          : null,
      courier: map['courier'] != null
          ? CourierModel.fromMap(map['courier'] as Map<String, dynamic>)
          : null,
      deliveryLocation: map['deliveryLocation'] != null
          ? LocationModel.fromMap(
              map['deliveryLocation'] as Map<String, dynamic>)
          : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      warehouseID:
          map['warehouseID'] != null ? map['warehouseID'] as String : null,
      courierID: map['courierID'] != null ? map['courierID'] as String : null,
      deliveryLocationId: map['deliveryLocationId'] != null
          ? map['deliveryLocationId'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, status: $status, details: $details, paymentType: $paymentType, timeCreated: $timeCreated, timeDelivered: $timeDelivered, courierEarnings: $courierEarnings, courierEarningsCurrency: $courierEarningsCurrency, totalCost: $totalCost, totalCostCurrency: $totalCostCurrency, user: $user, warehouse: $warehouse, courier: $courier, deliveryLocation: $deliveryLocation, userID: $userID, warehouseID: $warehouseID, courierID: $courierID, deliveryLocationId: $deliveryLocationId)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.status == status &&
        other.details == details &&
        other.paymentType == paymentType &&
        other.timeCreated == timeCreated &&
        other.timeDelivered == timeDelivered &&
        other.courierEarnings == courierEarnings &&
        other.courierEarningsCurrency == courierEarningsCurrency &&
        other.totalCost == totalCost &&
        other.totalCostCurrency == totalCostCurrency &&
        other.user == user &&
        other.warehouse == warehouse &&
        other.courier == courier &&
        other.deliveryLocation == deliveryLocation &&
        other.userID == userID &&
        other.warehouseID == warehouseID &&
        other.courierID == courierID &&
        other.deliveryLocationId == deliveryLocationId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        status.hashCode ^
        details.hashCode ^
        paymentType.hashCode ^
        timeCreated.hashCode ^
        timeDelivered.hashCode ^
        courierEarnings.hashCode ^
        courierEarningsCurrency.hashCode ^
        totalCost.hashCode ^
        totalCostCurrency.hashCode ^
        user.hashCode ^
        warehouse.hashCode ^
        courier.hashCode ^
        deliveryLocation.hashCode ^
        userID.hashCode ^
        warehouseID.hashCode ^
        courierID.hashCode ^
        deliveryLocationId.hashCode;
  }
}
