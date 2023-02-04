class SAllContractsModel {
  String? status;
  int? errors;
  int? code;
  Data? data;

  SAllContractsModel({this.status, this.errors, this.code, this.data});

  SAllContractsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<SContracts>? contracts;

  Data({this.contracts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['contracts'] != null) {
      contracts = <SContracts>[];
      json['contracts'].forEach((v) {
        contracts!.add(new SContracts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contracts != null) {
      data['contracts'] = this.contracts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SContracts {
  int? id;
  String? code;
  String? idCardNumber;
  int? status;

  SContracts({this.id, this.code, this.idCardNumber, this.status});

  SContracts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    idCardNumber = json['id_card_number'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['id_card_number'] = this.idCardNumber;
    data['status'] = this.status;
    return data;
  }
}
