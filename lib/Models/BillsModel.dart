class BillsModel {
  String? status;
  int? errors;
  int? code;
  List<Bill>? data;

  BillsModel({this.status, this.errors, this.code, this.data});

  BillsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Bill>[];
      json['data'].forEach((v) {
        data!.add(new Bill.fromJson(v));
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

class Bill {
  int? id;
  int? contractId;
  String? name;
  String? image;
  String? date;
  int? userId;
  String? viewingStatus;
  Contract? contract;

  Bill(
      {this.id,
        this.contractId,
        this.name,
        this.image,
        this.date,
        this.userId,
        this.viewingStatus,
        this.contract});

  Bill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractId = json['contract_id'];
    name = json['name'];
    image = json['image'];
    date = json['date'];
    userId = json['user_id'];
    viewingStatus = json['viewing_status'];
    contract = json['contract'] != null
        ? new Contract.fromJson(json['contract'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contract_id'] = this.contractId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['date'] = this.date;
    data['user_id'] = this.userId;
    data['viewing_status'] = this.viewingStatus;
    if (this.contract != null) {
      data['contract'] = this.contract!.toJson();
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
