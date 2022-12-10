import 'package:dio/dio.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:khaltah/Models/AllProjectsModal.dart';
import 'package:khaltah/Models/DashboardModel.dart';
import 'package:provider/provider.dart';

import '../Models/AllSectionsModel.dart';
import 'API.dart';

class SHomeHelper {
  SHomeHelper._();
  static SHomeHelper sHomeHelper= SHomeHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  Future<DashboardModel> getDashboard()async{
    Response response = await dio.get("$basedUrl/dashboard",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
    );
    return DashboardModel.fromJson(response.data);
  }



}