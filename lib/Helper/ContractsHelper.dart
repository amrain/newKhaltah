import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:khaltah/AppRouter.dart';
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