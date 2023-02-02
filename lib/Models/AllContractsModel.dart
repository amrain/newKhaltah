class AllContractsModel {
  String? status;
  int? errors;
  int? code;
  List<Contract>? data;

  AllContractsModel({this.status, this.errors, this.code, this.data});

  AllContractsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Contract>[];
      json['data'].forEach((v) {
        data!.add(new Contract.fromJson(v));
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

class Contract {
  int? id;
  String? code;
  String? idCardNumber;

  Contract({this.id, this.code, this.idCardNumber});

  Contract.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    idCardNumber = json['id_card_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['id_card_number'] = this.idCardNumber;
    return data;
  }
}
