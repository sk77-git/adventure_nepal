import 'dart:convert';

class ActivitiesResponse {
  String? status;
  String? message;
  List<Activity>? activities;

  ActivitiesResponse({this.status, this.message, this.activities});

  ActivitiesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['body'] != null) {
      activities = <Activity>[];
      json['body'].forEach((v) {
        activities!.add(new Activity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.activities != null) {
      data['body'] = this.activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activity {
  int? id;
  String? name;
  String? description;
  String? html;
  String? thumbnail;
  List<String>? weathers; // Updated data type
  List<String>? categories; // Updated data type

  Activity({
    this.id,
    this.name,
    this.description,
    this.html,
    this.thumbnail,
    this.weathers,
    this.categories,
  });

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    html = json['html'];
    thumbnail = json['thumbnail'];
    weathers = json['weathers'] != null
        ? List<String>.from(jsonDecode(json['weathers']))
        : null; // Convert string to list
    categories = json['categories'] != null
        ? List<String>.from(jsonDecode(json['categories']))
        : null; // Convert string to list
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['html'] = this.html;
    data['thumbnail'] = this.thumbnail;
    data['weathers'] = weathers != null
        ? jsonEncode(weathers)
        : null; // Convert list to string
    data['categories'] = categories != null
        ? jsonEncode(categories)
        : null; // Convert list to string
    return data;
  }
}
