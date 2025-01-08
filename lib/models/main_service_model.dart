import 'dart:convert';

MainServices mainServiceFromJson(String str) =>
    MainServices.fromJson(json.decode(str));

String mainServiceToJson(MainServices data) => json.encode(data.toJson());

class MainServices {
  bool success;
  List<Service> services;

  MainServices({
    required this.success,
    required this.services,
  });

  factory MainServices.fromJson(Map<String, dynamic> json) => MainServices(
        success: json["success"],
        services: List<Service>.from(
          json["data"].map(
            (x) => Service.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(
          services.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Service {
  String id;
  String type;
  String icon;

  Service({
    required this.id,
    required this.type,
    required this.icon,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        type: json["type"],
        icon: json['icon'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "icon": icon,
      };
}
