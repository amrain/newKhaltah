import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:khaltah/Helper/NotificationHelper.dart';
import 'package:khaltah/Models/NotificationModel.dart';

class NotificationProvider extends ChangeNotifier {
  bool loading = false;
  List<Notification> notifications = [];

  getNotification ()async{
    loading = true;
    notifyListeners();
    NotificationModel notificationModel = await NotificationHelper.notificationHelper.getNotification();
    notifications = notificationModel.data!;
    loading = false;
    notifyListeners();
    updateNotification();
  }

  updateNotification ()async{
    await NotificationHelper.notificationHelper.updateNotification();
    log('Update Notification');
    // notifyListeners();
  }

}