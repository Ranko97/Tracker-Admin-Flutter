// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocationModel {
  final String id;
  final double longitude;
  final double latitude;
  final double? altitude;
  final double? speed;
  final double? course;
  final double? altitudeAccuracy;
  final DateTime? dateTime;

  LocationModel({
    required this.id,
    required this.longitude,
    required this.latitude,
    this.altitude,
    this.speed,
    this.course,
    this.altitudeAccuracy,
    this.dateTime,
  });

  LocationModel copyWith({
    String? id,
    double? longitude,
    double? latitude,
    double? altitude,
    double? speed,
    double? course,
    double? altitudeAccuracy,
    DateTime? dateTime,
  }) {
    return LocationModel(
      id: id ?? this.id,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      altitude: altitude ?? this.altitude,
      speed: speed ?? this.speed,
      course: course ?? this.course,
      altitudeAccuracy: altitudeAccuracy ?? this.altitudeAccuracy,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'longitude': longitude,
      'latitude': latitude,
      'altitude': altitude,
      'speed': speed,
      'course': course,
      'altitudeAccuracy': altitudeAccuracy,
      'dateTime': dateTime?.toIso8601String(),
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: map['id'] as String,
      longitude: map['longitude'] as double,
      latitude: map['latitude'] as double,
      altitude: map['altitude'] != null ? map['altitude'] as double : null,
      speed: map['speed'] != null ? map['speed'] as double : null,
      course: map['course'] != null ? map['course'] as double : null,
      altitudeAccuracy: map['altitudeAccuracy'] != null
          ? map['altitudeAccuracy'] as double
          : null,
      dateTime:
          map['dateTime'] != null ? DateTime.parse(map['dateTime']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocationModel(id: $id, longitude: $longitude, latitude: $latitude, altitude: $altitude, speed: $speed, course: $course, altitudeAccuracy: $altitudeAccuracy, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.altitude == altitude &&
        other.speed == speed &&
        other.course == course &&
        other.altitudeAccuracy == altitudeAccuracy &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        altitude.hashCode ^
        speed.hashCode ^
        course.hashCode ^
        altitudeAccuracy.hashCode ^
        dateTime.hashCode;
  }
}
