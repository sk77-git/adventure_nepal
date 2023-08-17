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
  final int? id;
  final String? name;
  final List<String>? images;
  final String? thumbnail;
  final String? description;
  final String? html;
  final double? lat;
  final double? long;
  final String? tags;
  final String? nearbyPlaces;

  Place({
    this.id,
    this.name,
    this.images,
    this.thumbnail,
    this.description,
    this.html,
    this.lat,
    this.long,
    this.tags,
    this.nearbyPlaces,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      images: List<String>.from(jsonDecode(json['images'])),
      thumbnail: json['thumbnail'],
      description: json['description'],
      html: json['html'],
      lat: double.parse(json['lat']),
      long: double.parse(json['lang']),
      tags: json['tags'],
      nearbyPlaces: json['nearby_places'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': jsonEncode(images),
      'thumbnail': thumbnail,
      'description': description,
      'html': html,
      'lat': lat.toString(),
      'lang': long.toString(),
      'tags': jsonEncode(tags),
      'nearby_places': jsonEncode(nearbyPlaces),
    };
  }
}
