class AllProjectsModal {
  String? status;
  int? errors;
  int? code;
  List<Project>? data;

  AllProjectsModal({this.status, this.errors, this.code, this.data});

  AllProjectsModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Project>[];
      json['data'].forEach((v) {
        data!.add(new Project.fromJson(v));
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

class Project {
  int? id;
  String? name;
  String? icon;
  String? type;

  Project({this.id, this.name, this.icon, this.type});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['type'] = this.type;
    return data;
  }
}
