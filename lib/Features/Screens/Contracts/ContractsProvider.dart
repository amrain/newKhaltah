import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/ContractsHelper.dart';
import 'package:khaltah/Models/AllContractsModel.dart';
import 'package:khaltah/Models/ContractStatusModel.dart';
import 'package:khaltah/Models/SAllContractsModel.dart';

import '../../../Models/ContractStatusModel.dart';

class ContractsProvider extends ChangeNotifier {
  ContractsProvider(){
    getAllContracts();
  }
  int currentStep = 0;
  tapped(int step){
    currentStep = step;
    notifyListeners();
  }
  List<Contract>? contracts;
  List<SContracts>? Scontracts;
  ContractStatus? contractStatus;
  bool loading = false;
  String content = "";


  getAllContracts ()async{
    loading = true;
    notifyListeners();
    AllContractsModel allContractsModel = await ContractsHelper.contractsHelper.getAllContracts();
    contracts = allContractsModel.data;
    loading = false;
    notifyListeners();
  }

  getAllContractsSupervisor ()async{
    loading = true;
    notifyListeners();
    SAllContractsModel allContractsModel = await ContractsHelper.contractsHelper.getAllContractsSupervisor();
    Scontracts = allContractsModel.data?.contracts;
    loading = false;
    notifyListeners();
  }

  getContractStatus (int idContract)async{
    loading = true;
    notifyListeners();
    ContractStatusModel contractStatusModel = await ContractsHelper.contractsHelper.ContractStatus(idContract);
    contractStatus = contractStatusModel.data;
    loading = false;
     if (contractStatus!.status! == 2){
      currentStep = 3;
      content = "تم الموافقة على السعر المقدم من المؤسسة";
    }
    else if (contractStatus!.status! == 1){
      currentStep = 2;
      content = "الرجاء التأكيد على السعر المقدم من المؤسسة";
    }
    else if (contractStatus!.status! == 3 ){
      currentStep = 1;
      content = "تم مراجعة السعر المقدم من المؤسسة";
    }
    else if (contractStatus!.status! == 5 ){
      currentStep = 3;
    }
    else if (contractStatus!.status! == 6 ){
      currentStep = 4;
    }
    else{
      // currentStep = contractStatus!.status!;

    }

    notifyListeners();
  }

  updateContractStatus(int idContract , String status)async{
    await ContractsHelper.contractsHelper.updateContractStatus(idContract,status);
    getContractStatus(idContract);
  }



}