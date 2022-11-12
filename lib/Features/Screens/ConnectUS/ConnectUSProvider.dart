import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/ConnectUsHelper.dart';

class ConnectUSProvider extends ChangeNotifier{

  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController content = TextEditingController();
  ConnectUS()async{
    Response response = await ConnectUSHelper.connectUSHelper.ConnectUS(phone.text, email.text, content.text);
    log(response.data.toString());
  }
}