class UserModel {
  String? status;
  int? errors;
  int? code;
  AppUser? data;

  UserModel({this.status, this.errors, this.code, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    data = json['data'] != null ? new AppUser.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errors'] = this.errors;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AppUser {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  int? phone;
  String? image;
  String? city;
  String? type;
  String? status;
  String? createdAt;
  String? updatedAt;

  AppUser(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.image,
        this.city,
        this.type,
        this.status,
        this.createdAt,
        this.updatedAt});

  AppUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    image = json['image'];
    city = json['City'];
    type = json['type'];
    status = json['Status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['City'] = this.city;
    data['type'] = this.type;
    data['Status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
