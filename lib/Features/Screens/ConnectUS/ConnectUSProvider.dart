import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Helper/ConnectUsHelper.dart';
import 'package:string_validator/string_validator.dart';

class ConnectUSProvider extends ChangeNotifier{
  GlobalKey<FormState>? ConnectUsKey = GlobalKey();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController content = TextEditingController();

  bool loading = false;
  nullValidation(String v){
    if(v.isEmpty) {
      return 'هذا الحقل مطلوب';
    }}
  phoneValidation(String v){
    if(v.length !=6) {
      return 'الرقم يجيب ان يكون 6 أحرف';
    }}
  emailValidation(String v){
    if(v.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    else if(!isEmail(v)) {
      return 'هذا البريد غير صحيح';
    }
  }

  ConnectUS()async{
    loading = true;
    notifyListeners();
     await ConnectUSHelper.connectUSHelper.ConnectUS(phone.text, email.text, content.text);
    // Response response = await ConnectUSHelper.connectUSHelper.ConnectUS(phone.text, email.text, content.text);
    // log(response.data.toString());
    loading = false;
    notifyListeners();
    AwesomeDialog(
      context: AppRouter.navKey.currentContext!,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'تم الارسال',
      desc: 'تم ارسال الرسالة بنجاح',
      btnOkText: 'موافق',
      btnOkOnPress: () {
        email.clear();
        phone.clear();
        content.clear();
        notifyListeners();
      },
    ).show();
  }
}