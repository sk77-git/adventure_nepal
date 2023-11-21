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
  String? weathers;
  String? categories;

  Place(
      {this.id,
      this.name,
      this.thumbnail,
      this.description,
      this.html,
      this.lat,
      this.long,
      this.weathers,
      this.categories});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    html = json['html'];
    lat = json['lat'];
    long = json['long'];
    weathers = json['weathers'];
    categories = json['categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['thumbnail'] = this.thumbnail;
    data['description'] = this.description;
    data['html'] = this.html;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['weathers'] = this.weathers;
    data['categories'] = this.categories;
    return data;
  }
}
