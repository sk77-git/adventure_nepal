class LoginResponse {
  String? status;
  bool? isVerified;
  String? message;

  LoginResponse({this.status, this.isVerified, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isVerified = json['is_verified'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['is_verified'] = this.isVerified;
    data['message'] = this.message;
    return data;
  }
}
