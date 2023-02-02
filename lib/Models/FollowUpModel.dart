


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
  String? startDate;
  String? endDate;
  String? workVideo;
  int? userId;
  String? viewingStatus;
  Contract? contract;
  List<Images>? images;

  FollowUp(
      {this.id,
        this.contractId,
        this.name,
        this.startDate,
        this.endDate,
        this.workVideo,
        this.userId,
        this.viewingStatus,
        this.contract,
        this.images});

  FollowUp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractId = json['contract_id'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    workVideo = json['work_video'];
    userId = json['user_id'];
    viewingStatus = json['viewing_status'];
    contract = json['contract'] != null
        ? new Contract.fromJson(json['contract'])
        : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contract_id'] = this.contractId;
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['work_video'] = this.workVideo;
    data['user_id'] = this.userId;
    data['viewing_status'] = this.viewingStatus;
    if (this.contract != null) {
      data['contract'] = this.contract!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
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

class Images {
  String? image;

  Images({this.image});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}

