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
  String? weathers;
  String? categories;

  Activity(
      {this.id,
      this.name,
      this.description,
      this.html,
      this.thumbnail,
      this.weathers,
      this.categories});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    html = json['html'];
    thumbnail = json['thumbnail'];
    weathers = json['weathers'];
    categories = json['categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['html'] = this.html;
    data['thumbnail'] = this.thumbnail;
    data['weathers'] = this.weathers;
    data['categories'] = this.categories;
    return data;
  }
}
