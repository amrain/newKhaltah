class AboutUsModel {
  String? status;
  int? errors;
  int? code;
  AboutUs? data;

  AboutUsModel({this.status, this.errors, this.code, this.data});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    data = json['data'] != null ? new AboutUs.fromJson(json['data']) : null;
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

class AboutUs {
  int? id;
  String? logo;
  String? content;
  String? termsConditions;

  AboutUs({this.id, this.logo, this.content, this.termsConditions});

  AboutUs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    content = json['content'];
    termsConditions = json['terms_conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['content'] = this.content;
    data['terms_conditions'] = this.termsConditions;
    return data;
  }
}
