class LoginResponse {
  String? status;
  bool? isVerified;
  String? message;
  User? user;

  LoginResponse({this.status, this.isVerified, this.message, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isVerified = json['is_verified'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['is_verified'] = this.isVerified;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? email;
  String? password;
  String? categories;
  String? otp;
  int? isVerified;
  String? createdAt;
  String? updatedAt;
  String? otpExpiry;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.password,
      this.categories,
      this.otp,
      this.isVerified,
      this.createdAt,
      this.updatedAt,
      this.otpExpiry});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    password = json['password'];
    categories = json['categories'];
    otp = json['otp'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    otpExpiry = json['otp_expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['categories'] = this.categories;
    data['otp'] = this.otp;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['otp_expiry'] = this.otpExpiry;
    return data;
  }
}
