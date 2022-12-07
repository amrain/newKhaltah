import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Models/NotificationModel.dart';
import 'package:provider/provider.dart';

import '../Features/Screens/Authentication/AuthProvider.dart';
import 'API.dart';

class NotificationHelper {
  NotificationHelper._();
  static NotificationHelper notificationHelper= NotificationHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  Future<NotificationModel> getNotification()async{
    Response response = await dio.get("$basedUrl/notification/show",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
    );
    return NotificationModel.fromJson(response.data);
  }

  updateNotification()async{
    Response response = await dio.post("$basedUrl/notification/update",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
    );

    log(response.data.toString());

  }
}