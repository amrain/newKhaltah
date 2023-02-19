import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/ConnectUsHelper.dart';
import 'package:khaltah/Helper/SBondHelper.dart';
import 'package:khaltah/Helper/SScheduleHelper.dart';
import 'package:string_validator/string_validator.dart';

class SScheduleProvider extends ChangeNotifier{
  GlobalKey<FormState>? ScheduleKey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController date = TextEditingController();


  bool loading = false;
  nullValidation(String v){
    if(v.isEmpty) {
      return 'هذا الحقل مطلوب';
    }}
  emailValidation(String v){
    if(v.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    else if(!isEmail(v)) {
      return 'هذا البريد غير صحيح';
    }
  }


  ScheduleStore(String id)async{
    try{
      loading = true;
      notifyListeners();
      await SScheduleHelper.sScheduleHelper
          .ScheduleStore(id, name.text, email.text, date.text);
      // log(response.data.toString());
      loading = false;
      notifyListeners();
      AwesomeDialog(
        context: AppRouter.navKey.currentContext!,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'تم الارسال',
        desc: 'تم إضافة الجدول',
        btnOkText: 'موافق',
        btnOkOnPress: () {
          name.clear();
          email.clear();
          date.clear();
          notifyListeners();
        },
      ).show();
    }
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }
}