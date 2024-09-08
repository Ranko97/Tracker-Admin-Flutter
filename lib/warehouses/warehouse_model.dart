// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dipl_admin/locations/location_model.dart';

class WarehouseModel {
  final String id;
  final String address;
  final String phoneNumber;
  final LocationModel? location;

  WarehouseModel({
    required this.id,
    required this.address,
    required this.phoneNumber,
    required this.location,
  });

  WarehouseModel copyWith({
    String? id,
    String? address,
    String? phoneNumber,
    LocationModel? location,
  }) {
    return WarehouseModel(
      id: id ?? this.id,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'address': address,
      'phoneNumber': phoneNumber,
      'location': location?.toMap(),
    };
  }

  factory WarehouseModel.fromMap(Map<String, dynamic> map) {
    return WarehouseModel(
      id: map['id'] as String,
      address: map['address'] as String,
      phoneNumber: map['phoneNumber'] as String,
      location: map['location'] != null
          ? LocationModel.fromMap(map['location'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WarehouseModel.fromJson(String source) =>
      WarehouseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WarehouseModel(id: $id, address: $address, phoneNumber: $phoneNumber, location: $location)';
  }

  @override
  bool operator ==(covariant WarehouseModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.address == address &&
        other.phoneNumber == phoneNumber &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        address.hashCode ^
        phoneNumber.hashCode ^
        location.hashCode;
  }
}
