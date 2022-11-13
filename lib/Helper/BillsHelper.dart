import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../AppRouter.dart';
import '../Features/Screens/Authentication/AuthProvider.dart';
import '../Models/BillsModel.dart';
import 'API.dart';

class BillsHelper {
  BillsHelper._();
  static BillsHelper billsHelper = BillsHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  Future<BillsModel> BillShow(int idContract)async{
    log("$basedUrl/invoices/show/$idContract");
    log("--------------------");
    log(Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken.toString());
    log("--------------------");

    Response response = await dio.get("$basedUrl/invoices/show/$idContract",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
    );
    log(response.data.toString());
    return BillsModel.fromJson(response.data);
  }
}