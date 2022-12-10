class DashboardModel {
  String? status;
  int? errors;
  int? code;
  Dashboard? data;

  DashboardModel({this.status, this.errors, this.code, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    data = json['data'] != null ? new Dashboard.fromJson(json['data']) : null;
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

class Dashboard {
  int? contracts;
  int? invoices;
  int? work;
  int? scheduleOfWork;

  Dashboard({this.contracts, this.invoices, this.work, this.scheduleOfWork});

  Dashboard.fromJson(Map<String, dynamic> json) {
    contracts = json['contracts'];
    invoices = json['invoices'];
    work = json['work'];
    scheduleOfWork = json['schedule of work'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contracts'] = this.contracts;
    data['invoices'] = this.invoices;
    data['work'] = this.work;
    data['schedule of work'] = this.scheduleOfWork;
    return data;
  }
}
