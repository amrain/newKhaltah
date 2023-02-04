import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Contracts/ContractsProvider.dart';
import 'package:khaltah/Models/SAllContractsModel.dart';
import 'package:provider/provider.dart';

import '../Features/Screens/Authentication/AuthProvider.dart';
import '../Models/AllContractsModel.dart';
import '../Models/ContractStatusModel.dart';
import 'API.dart';

class ContractsHelper {
  ContractsHelper._();
  static ContractsHelper contractsHelper = ContractsHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  Future<AllContractsModel> getAllContracts()async{
    Response response = await dio.get("$basedUrl/contracts/show",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
    );
    return AllContractsModel.fromJson(response.data);
  }
  getAllContractsSupervisor()async{
    try
    {
      Response response = await dio.get(
        "$basedUrl/contract",
        options: Options(
          headers: <String, dynamic>{
            "Authorization":
                "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!, listen: false).User.accessToken}"
          },
        ),
      );
      return SAllContractsModel.fromJson(response.data);
    }
    catch(e){
      API.showErrorMsg();
      Provider.of<ContractsProvider>(AppRouter.navKey.currentContext!,listen: false).loading=false;
    }
  }

  Future<ContractStatusModel> ContractStatus(int idContract)async{
    log("$basedUrl/contracts/status/$idContract");
    log("--------------------");
    log(Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken.toString());
    log("--------------------");

    Response response = await dio.get("$basedUrl/contracts/status/$idContract",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
    );
    return ContractStatusModel.fromJson(response.data);
  }

  updateContractStatus(int idContract ,String status) async{
    Response response = await dio.post("$basedUrl/contracts/status/$idContract",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
      data: jsonEncode(
        <String, dynamic>{
          'status':status,
        },
      ),
    );
    log(response.data.toString());
  }




}