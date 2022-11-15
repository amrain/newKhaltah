class NotificationModel {
  String? status;
  int? errors;
  int? code;
  List<Notification>? data;

  NotificationModel({this.status, this.errors, this.code, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Notification>[];
      json['data'].forEach((v) {
        data!.add(new Notification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errors'] = this.errors;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notification {
  int? id;
  String? message;
  String? messageType;
  String? status;
  String? createdAt;

  Notification({this.id, this.message, this.messageType, this.status, this.createdAt});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    messageType = json['message_type'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['message_type'] = this.messageType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
