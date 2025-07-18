import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:khaltah/Features/Supervisor/WorkAndBill/SWorkAndBillProvider.dart';
import 'package:provider/provider.dart';
import 'API.dart';

class SWorkAndInvoiceHelper {
  SWorkAndInvoiceHelper._();
  static SWorkAndInvoiceHelper sWorkAndInvoiceHelper = SWorkAndInvoiceHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  AddInvoice(String id ,String name, String date) async{
    Response response = await dio.post("$basedUrl/invoices/store",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
      data: FormData.fromMap(
          {
            'contract_id':id,
            'name':name,
            'date':date,
            'image':await MultipartFile.fromFile(
              File(Provider.of<SWorkAndBillProvider>(AppRouter.navKey.currentContext!,listen: false).imageInvoice!.paths.last.toString()).path,
              filename: Provider.of<SWorkAndBillProvider>(AppRouter.navKey.currentContext!,listen: false).imageInvoice!.paths.single!.split("/").last.toString(),),
          }
      )
      ,
    );
    log(response.data.toString());
  }


  AddWork(String id ,String name, String startDate, String endDate, List<FilePickerResult> imagesWork ,FilePickerResult videoWork) async{

    // List<MultipartFile> listFile = [];
    // // for (var i = 0; i < Provider.of<SWorkAndBillProvider>(AppRouter.navKey.currentContext!,listen: false).imagesWork.length; i++) {
    // //   listFile.add(
    // //     await MultipartFile.fromFile(Provider.of<SWorkAndBillProvider>(AppRouter.navKey.currentContext!,listen: false).imagesWork[i].path,
    // //         filename: Provider.of<SWorkAndBillProvider>(AppRouter.navKey.currentContext!,listen: false).imagesWork[i].path.split("/").last.toString()),
    // //   );
    // // }

    List listFile = [];
    for(int i = 0 ; i < imagesWork.length ; i++){
      var multipartFile = await MultipartFile.fromFile(File(imagesWork[i].paths.last.toString()).path,
        filename: imagesWork[i].paths.single!.split("/").last.toString());
      listFile.add(multipartFile);
    }



    Response response = await dio.post("$basedUrl/work/store",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
      data: FormData.fromMap(
          {
            'contract_id':id,
            'name':name,
            'start_date':startDate,
            'end_date':endDate,
            'image[]' : [
                ...listFile
            ],

            // imagesWork.map((e) async {
            //   return await MultipartFile.fromFile(File(e.paths.last.toString()).path,
            //     filename: e.paths.single!.split("/").last.toString(),);
            // }).toList,

            // 'image[]' :
            //  Provider.of<SWorkAndBillProvider>(AppRouter.navKey.currentContext!,listen: false).imagesWork.map((e)async{
            //    log(e.path);
            //   return await MultipartFile.fromFile(
            //     e.path,filename: e.path.split("/").last.toString()
            //   );
            // }).toList()
            // ,

            // 'image[]' :
            //   [
            //     await MultipartFile.fromFile(
            //       File(Provider.of<SWorkAndBillProvider>(AppRouter.navKey.currentContext!,listen: false).VideoWork!.paths.last.toString()).path,
            //       filename: Provider.of<SWorkAndBillProvider>(AppRouter.navKey.currentContext!,listen: false).VideoWork!.paths.single!.split("/").last.toString(),),
            //     await MultipartFile.fromFile(
            //       File(Provider.of<SWorkAndBillProvider>(AppRouter.navKey.currentContext!,listen: false).VideoWork!.paths.last.toString()).path,
            //       filename: Provider.of<SWorkAndBillProvider>(AppRouter.navKey.currentContext!,listen: false).VideoWork!.paths.single!.split("/").last.toString(),),
            //   ]
            //   ,
            'work_video': await MultipartFile.fromFile(
              File(videoWork.paths.last.toString()).path,
              filename: videoWork.paths.single!.split("/").last.toString(),),


          }
      )
      ,
    );
    log(response.data.toString());
  }

}