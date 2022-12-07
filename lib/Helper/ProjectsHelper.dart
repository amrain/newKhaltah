import 'package:dio/dio.dart';
import 'package:khaltah/Models/AllProjectsModal.dart';

import '../Models/AllSectionsModel.dart';
import 'API.dart';

class HomeHelper {
  HomeHelper._();
  static HomeHelper homeHelper= HomeHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  Future<AllProjectsModal> getAllProjects()async{
    Response response = await dio.get("$basedUrl/project",
      options: Options(
        headers: <String, String>{
        },),
      );
    return AllProjectsModal.fromJson(response.data);
  }



}