class UserInterestsResponse {
  String? status;
  String? message;
  List<String>? userCategories;
  List<AllCategories>? allCategories;

  UserInterestsResponse(
      {this.status, this.message, this.userCategories, this.allCategories});

  UserInterestsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userCategories = json['user_categories'].cast<String>();
    if (json['all_categories'] != null) {
      allCategories = <AllCategories>[];
      json['all_categories'].forEach((v) {
        allCategories!.add(new AllCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['user_categories'] = this.userCategories;
    if (this.allCategories != null) {
      data['all_categories'] =
          this.allCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllCategories {
  int? id;
  String? category;

  AllCategories({this.id, this.category});

  AllCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    return data;
  }
}
