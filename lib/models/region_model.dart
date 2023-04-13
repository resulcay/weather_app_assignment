import 'dart:convert';

class RegionModel {
  final Name name;
  final List<String> capital;
  final String region;
  final List<double> latlng;
  final CapitalInfo capitalInfo;

  RegionModel({
    required this.name,
    required this.capital,
    required this.region,
    required this.latlng,
    required this.capitalInfo,
  });

  factory RegionModel.fromJson(String str) =>
      RegionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegionModel.fromMap(Map<String, dynamic> json) => RegionModel(
        name: Name.fromMap(json["name"]),
        capital: List<String>.from(json["capital"].map((x) => x)),
        region: json["region"],
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
        capitalInfo: CapitalInfo.fromMap(json["capitalInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name.toMap(),
        "capital": List<dynamic>.from(capital.map((x) => x)),
        "region": region,
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "capitalInfo": capitalInfo.toMap(),
      };
}

class CapitalInfo {
  CapitalInfo({
    required this.latlng,
  });

  final List<double> latlng;

  factory CapitalInfo.fromJson(String str) =>
      CapitalInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CapitalInfo.fromMap(Map<String, dynamic> json) => CapitalInfo(
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
      };
}

class Name {
  Name({
    required this.common,
    required this.official,
  });

  final String common;
  final String official;

  factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
      );

  Map<String, dynamic> toMap() => {
        "common": common,
        "official": official,
      };
}
