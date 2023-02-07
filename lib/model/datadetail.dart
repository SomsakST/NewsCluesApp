// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Cluesdata {
  String Location;
  String Time;
  String Date;
  String Type;
  String Details;
  String Name;
  String Phone;
  String Point;

  Cluesdata({
    required this.Location,
    required this.Date,
    required this.Time,
    required this.Type,
    required this.Details,
    required this.Name,
    required this.Phone,
    required this.Point,
  });

  Cluesdata copyWith({
    String? Location,
    String? Time,
    String? Date,
    String? Type,
    String? Details,
    String? Name,
    String? Phone,
    String? Point,
  }) {
    return Cluesdata(
        Location: Location ?? this.Location,
        Time: Time ?? this.Time,
        Date: Date ?? this.Date,
        Type: Type ?? this.Type,
        Details: Details ?? this.Details,
        Name: Name ?? this.Name,
        Phone: Phone ?? this.Phone,
        Point: Point ?? this.Point);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'Location': Location});
    result.addAll({'Time': Time});
    result.addAll({'Date': Date});
    result.addAll({'Type': Type});
    result.addAll({'Details': Details});
    result.addAll({'Name': Name});
    result.addAll({'Phone': Phone});
    result.addAll({'Point': Point});

    return result;
  }

  factory Cluesdata.fromMap(Map<String, dynamic> map) {
    return Cluesdata(
      Location: map['Location'] ?? '',
      Time: map['Time'] ?? '',
      Date: map['Date'] ?? '',
      Type: map['Type'] ?? '',
      Details: map['Details'] ?? '',
      Name: map['Name'] ?? '',
      Phone: map['Phone'] ?? '',
      Point: map['Point'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cluesdata.fromJson(String source) =>
      Cluesdata.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cluesdata(Location: $Location, Time: $Time, Date: $Date, Type: $Type, Details: $Details, Name: $Name ,Phone: $Phone, Point: $Point )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cluesdata &&
        other.Location == Location &&
        other.Date == Date &&
        other.Time == Time &&
        other.Type == Type &&
        other.Details == Details &&
        other.Name == Name &&
        other.Phone == Phone &&
        other.Point == Point;
  }

  @override
  int get hashCode {
    return Location.hashCode ^
        Date.hashCode ^
        Time.hashCode ^
        Type.hashCode ^
        Details.hashCode ^
        Name.hashCode ^
        Phone.hashCode ^
        Point.hashCode;
  }
}
