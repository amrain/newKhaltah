import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:provider/provider.dart';
import 'API.dart';

class SScheduleHelper {
  SScheduleHelper._();
  static SScheduleHelper sScheduleHelper = SScheduleHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  ScheduleStore(String id ,String name, String email , String date) async{
    Response response = await dio.post("$basedUrl/schedule_of_work/store",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
      data: jsonEncode(
        <String, dynamic>{
          'contract_id':id,
          'name':name,
          'email':email,
          'date':date,
        },
      ),
    );
    log(response.data.toString());
  }

}