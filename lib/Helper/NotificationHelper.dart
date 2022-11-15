import 'package:dio/dio.dart';

import 'API.dart';

class NotificationHelper {
  NotificationHelper._();
  static NotificationHelper notificationHelper= NotificationHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  getNotification (){

  }
}