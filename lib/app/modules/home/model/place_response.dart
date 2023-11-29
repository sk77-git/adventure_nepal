import 'dart:convert';

class PlacesResponse {
  String? status;
  String? message;
  List<Place>? places;

  PlacesResponse({this.status, this.message, this.places});

  PlacesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['body'] != null) {
      places = <Place>[];
      json['body'].forEach((v) {
        places!.add(new Place.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.places != null) {
      data['body'] = this.places!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Place {
  int? id;
  String? name;
  String? thumbnail;
  String? description;
  String? html;
  String? lat;
  String? long;
  List<String>? weathers; // Updated data type
  List<String>? categories; // Updated data type

  Place({
    this.id,
    this.name,
    this.thumbnail,
    this.description,
    this.html,
    this.lat,
    this.long,
    this.weathers,
    this.categories,
  });

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    html = json['html'];
    lat = json['lat'];
    long = json['long'];
    weathers = json['weathers'] != null
        ? List<String>.from(jsonDecode(json['weathers']))
        : null; // Convert string to list
    categories = json['categories'] != null
        ? List<String>.from(jsonDecode(json['categories']))
        : null; // Convert string to list
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['description'] = description;
    data['html'] = html;
    data['lat'] = lat;
    data['long'] = long;
    data['weathers'] = weathers != null
        ? jsonEncode(weathers)
        : null; // Convert list to string
    data['categories'] = categories != null
        ? jsonEncode(categories)
        : null; // Convert list to string
    return data;
  }
}
