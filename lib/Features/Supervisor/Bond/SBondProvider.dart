import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/ConnectUsHelper.dart';
import 'package:khaltah/Helper/SBondHelper.dart';
import 'package:string_validator/string_validator.dart';

class SBondProvider extends ChangeNotifier{
  GlobalKey<FormState>? BondKey = GlobalKey();
  TextEditingController number = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController date = TextEditingController();

  bool loading = false;
  nullValidation(String v){
    if(v.isEmpty) {
      return 'هذا الحقل مطلوب';
    }}


  BondStore()async{
    try{
      loading = true;
      notifyListeners();
      await SBondHelper.sBondHelper.BondStore(
          number.text, name.text, amount.text, reason.text, date.text);
      // log(response.data.toString());
      loading = false;
      notifyListeners();
      AwesomeDialog(
        context: AppRouter.navKey.currentContext!,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'تم الارسال',
        desc: 'تم إضافة السند',
        btnOkText: 'موافق',
        btnOkOnPress: () {
          number.clear();
          name.clear();
          amount.clear();
          reason.clear();
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