import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/NotificationHelper.dart';
import 'package:khaltah/Models/NotificationModel.dart';

class NotificationProvider extends ChangeNotifier {
  bool loading = false;
  List<Notification> notifications = [];

  getNotification ()async{
    try{
      loading = true;
      notifyListeners();
      NotificationModel notificationModel =
          await NotificationHelper.notificationHelper.getNotification();
      notifications = notificationModel.data!;
      loading = false;
      notifyListeners();
      updateNotification();
    }
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }

  updateNotification ()async{
    try{
      await NotificationHelper.notificationHelper.updateNotification();
      log('Update Notification');
      // notifyListeners();
      }
    catch(e){
      API.showErrorMsg();
      // loading = false;
      // notifyListeners();
    }
  }

}