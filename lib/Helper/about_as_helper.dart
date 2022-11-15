

import 'package:dio/dio.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Models/AboutAsModel.dart';
import 'package:provider/provider.dart';

import '../Features/Screens/Authentication/AuthProvider.dart';

class AboutAsHelper {
  AboutAsHelper._();
  static AboutAsHelper aboutAsHelper= AboutAsHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

   Future<AboutUs> aboutUs ()async{
    Response  response = await dio.get("$basedUrl/about_us",
    options: Options(
      headers: {
        "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
      }
    ));

    AboutUsModel aboutUsModel = AboutUsModel.fromJson(response.data);
    return aboutUsModel.data!;




  }






}