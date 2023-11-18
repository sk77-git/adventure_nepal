class UserInterestsResponse {
  String? status;
  String? message;
  List<String>? interests;

  UserInterestsResponse({this.status, this.message, this.interests});

  UserInterestsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    interests = json['interests'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['interests'] = this.interests;
    return data;
  }
}
