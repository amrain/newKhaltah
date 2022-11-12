class AuthModel {
  bool? status;
  int? code;
  String? message;
  String? type;
  String? accessToken;

  AuthModel(
      {this.status, this.code, this.message, this.type, this.accessToken});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    type = json['type'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['type'] = this.type;
    data['accessToken'] = this.accessToken;
    return data;
  }
}
