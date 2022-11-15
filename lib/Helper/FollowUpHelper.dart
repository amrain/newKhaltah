import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../AppRouter.dart';
import '../Features/Screens/Authentication/AuthProvider.dart';
import '../Models/FollowUpModel.dart';
import 'API.dart';

class FollowUpHelper {
  FollowUpHelper._();
  static FollowUpHelper followUpHelper = FollowUpHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  Future<FollowUpModel> getFollowUp(int idContract)async{
    log("$basedUrl/work/show/$idContract");
    log("--------------------");
    log(Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken.toString());
    log("--------------------");

    Response response = await dio.get("$basedUrl/work/show/$idContract",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
    );
    return FollowUpModel.fromJson(response.data);
  }
}