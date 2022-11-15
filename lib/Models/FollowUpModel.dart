class FollowUpModel {
  String? status;
  int? errors;
  int? code;
  List<FollowUp>? data;

  FollowUpModel({this.status, this.errors, this.code, this.data});

  FollowUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    if (json['data'] != null) {
      data = <FollowUp>[];
      json['data'].forEach((v) {
        data!.add(new FollowUp.fromJson(v));
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

class FollowUp {
  int? id;
  int? contractId;
  String? name;
  String? date;
  int? userId;
  String? viewingStatus;
  Contract? contract;
  List<Image>? image;

  FollowUp(
      {this.id,
        this.contractId,
        this.name,
        this.date,
        this.userId,
        this.viewingStatus,
        this.contract,
        this.image});

  FollowUp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractId = json['contract_id'];
    name = json['name'];
    date = json['date'];
    userId = json['user_id'];
    viewingStatus = json['viewing_status'];
    contract = json['contract'] != null
        ? new Contract.fromJson(json['contract'])
        : null;
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contract_id'] = this.contractId;
    data['name'] = this.name;
    data['date'] = this.date;
    data['user_id'] = this.userId;
    data['viewing_status'] = this.viewingStatus;
    if (this.contract != null) {
      data['contract'] = this.contract!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contract {
  int? id;
  String? code;

  Contract({this.id, this.code});

  Contract.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    return data;
  }
}

class Image {
  String? image;

  Image({this.image});

  Image.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}
