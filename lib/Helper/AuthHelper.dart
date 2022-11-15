import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:khaltah/Models/AuthModel.dart';
import 'package:provider/provider.dart';

import '../AppRouter.dart';
import 'API.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper= AuthHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;


  Future<AuthModel>login(String email,String password)async{
    Response response = await dio.post("$basedUrl/login",
      options: Options(
        headers: <String, String>{
        },),
      data: jsonEncode(
        <String, dynamic>{
          'email':email,
          'password':password,
        },
      ),);

    AuthModel user = AuthModel.fromJson(response.data);
    log(user.accessToken.toString());
    return user;
  }



  Future<AuthModel> register(String name,String email,String phone,String City,String password,String password_confirmation,)async{
    Response response = await dio.post("$basedUrl/register",
            options: Options(
              headers: <String, String>{
              },),
            data: jsonEncode(
              <String, dynamic>{
                'name':name,
                'email':email,
                'phone':phone,
                'City':City,
                'password':password,
                'password_confirmation':password_confirmation,
              },
            ),);

     AuthModel user = AuthModel.fromJson(response.data);
      log(user.accessToken.toString());
      return user;
  }


  forgetPassword(String email)async{
    Response response = await dio.post("$basedUrl/forgot-password",
      data: jsonEncode(
        <String, dynamic>{
          'email':email,
        },
      ),);
    int errors = response.data["errors"] ;
    if(errors == 1){
      AwesomeDialog(
        context: AppRouter.navKey.currentContext!,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'خطأ',
        desc: response.data["data"],
        btnOkText: 'موافق',
        btnOkOnPress: () {

        },
      ).show();

    }else {
      AwesomeDialog(
        context: AppRouter.navKey.currentContext!,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'تم الارسال',
        desc: response.data["data"],
        btnOkText: 'موافق',
        btnOkOnPress: () {
          AppRouter.popFromWidget();
          Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).forgetPasswordController.clear();

        },
      ).show();


    }
  }

}