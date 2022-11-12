class ContractStatusModel {
  bool? status;
  int? code;
  ContractStatus? data;

  ContractStatusModel({this.status, this.code, this.data});

  ContractStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new ContractStatus.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ContractStatus {
  int? id;
  String? code;
  int? status;
  String? contractFile;
  int? price;
  String? finalContract;

  ContractStatus(
      {this.id,
        this.code,
        this.status,
        this.contractFile,
        this.price,
        this.finalContract});

  ContractStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    status = json['status'];
    contractFile = json['contract_file'];
    price = json['price'];
    finalContract = json['final_contract'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['status'] = this.status;
    data['contract_file'] = this.contractFile;
    data['price'] = this.price;
    data['final_contract'] = this.finalContract;
    return data;
  }
}
