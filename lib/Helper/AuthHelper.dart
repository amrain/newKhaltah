import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:khaltah/Models/AuthModel.dart';

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


  forgetPassword(){

  }

}