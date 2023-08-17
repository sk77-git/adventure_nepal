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
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  String? html;
  String? icon;
  String? tags;
  String? cities;
  String? weathers;
  String? minTemp;
  String? maxTemp;

  Activity(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.description,
      this.html,
      this.icon,
      this.tags,
      this.cities,
      this.weathers,
      this.minTemp,
      this.maxTemp});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    description = json['description'];
    html = json['html'];
    icon = json['icon'];
    tags = json['tags'];
    cities = json['cities'];
    weathers = json['weathers'];
    minTemp = json['min_temp'];
    maxTemp = json['max_temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['html'] = this.html;
    data['icon'] = this.icon;
    data['tags'] = this.tags;
    data['cities'] = this.cities;
    data['weathers'] = this.weathers;
    data['min_temp'] = this.minTemp;
    data['max_temp'] = this.maxTemp;
    return data;
  }
}
