import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:provider/provider.dart';
import 'API.dart';

class ConnectUSHelper {
  ConnectUSHelper._();
  static ConnectUSHelper connectUSHelper = ConnectUSHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

   ConnectUS(String phone ,String email, String content) async{
    Response response = await dio.post("$basedUrl/connect_us/store",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
      data: jsonEncode(
        <String, dynamic>{
          'phone':phone,
          'email':email,
          'content':content,
        },
      ),
    );
    log(response.data.toString());
  }

}