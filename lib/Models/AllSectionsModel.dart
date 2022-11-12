class AllSectionsModel {
  String? status;
  int? errors;
  int? code;
  List<Section>? data;

  AllSectionsModel({this.status, this.errors, this.code, this.data});

  AllSectionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Section>[];
      json['data'].forEach((v) {
        data!.add(new Section.fromJson(v));
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

class Section {
  int? id;
  int? projectId;
  String? name;

  Section({this.id, this.projectId, this.name});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['name'] = this.name;
    return data;
  }
}
