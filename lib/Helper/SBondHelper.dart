import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:provider/provider.dart';
import 'API.dart';

class SBondHelper {
  SBondHelper._();
  static SBondHelper sBondHelper = SBondHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  BondStore(String number ,String name, String amount , String reason , String date) async{
    Response response = await dio.post("$basedUrl/bond/store",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
      data: jsonEncode(
        <String, dynamic>{
          'contract_number':number,
          'supervisor_name':name,
          'exchange_amount':amount,
          'exchange_reason':reason,
          'date_of_application':date,
        },
      ),
    );
    log(response.data.toString());
  }

}