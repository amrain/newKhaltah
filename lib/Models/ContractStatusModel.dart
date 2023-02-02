
class ContractStatusModel {
  String? status;
  int? errors;
  int? code;
  ContractStatus? data;

  ContractStatusModel({this.status, this.errors, this.code, this.data});

  ContractStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    data = json['data'] != null ? new ContractStatus.fromJson(json['data']) : null;
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

class ContractStatus {
  int? id;
  String? code;
  int? status;
  String? contractFile;
  int? price;
  String? idCardNumber;
  Null? finalContract;

  ContractStatus(
      {this.id,
        this.code,
        this.status,
        this.contractFile,
        this.price,
        this.idCardNumber,
        this.finalContract});

  ContractStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    status = json['status'];
    contractFile = json['contract_file'];
    price = json['price'];
    idCardNumber = json['id_card_number'];
    finalContract = json['final_contract'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['status'] = this.status;
    data['contract_file'] = this.contractFile;
    data['price'] = this.price;
    data['id_card_number'] = this.idCardNumber;
    data['final_contract'] = this.finalContract;
    return data;
  }
}


