import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:khaltah/Features/Screens/Home/Section/SectionProvider.dart';
import 'package:khaltah/Models/SpecialConditionsModel.dart';
import 'package:provider/provider.dart';

import '../Models/AllSectionsModel.dart';
import 'API.dart';

class SectionHelper {
  SectionHelper._();
  static SectionHelper sectionHelper= SectionHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

  Future<AllSectionsModel> getSection(String id)async{
    Response response = await dio.get("$basedUrl/sections/$id",
      options: Options(
        headers: <String, String>{
        },),
    );
    return AllSectionsModel.fromJson(response.data);
  }

  contractsStore (
      String project_id,String section_id,String construction_type,String id_card_number,String id_card_date,
      String status_card_issuer,String Instrument_no,String Instrument_date,
      String building_permit_number,String license_date,String engineering_office_name,String engineer_name,
      String engineer_phone_email
      )
  async{
    Response response = await dio.post("$basedUrl/contracts/store",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
      data: {
          'project_id':project_id,
          'section_id':section_id,
          'construction_type':construction_type,
          'id_card_number':id_card_number,
          'id_card_date':id_card_date,
          'status_card_issuer':status_card_issuer,
          // 'status_card_image':await MultipartFile.fromFile(
          //   File(Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).status_card_image!.paths.last.toString()).path,
          //   filename: Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).status_card_image!.paths.single!.split("/").last.toString(),),
          'Instrument_no':Instrument_no,
          'Instrument_date':Instrument_date,
          // 'Instrument_image':await MultipartFile.fromFile(
          //   File(Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).Instrument_image!.paths.last.toString()).path,
          //   filename: Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).Instrument_image!.paths.single!.split("/").last.toString(),),
          'building_permit_number':building_permit_number,
          'license_date':license_date,
          // 'license_image':await MultipartFile.fromFile(
          //   File(Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).license_image!.paths.last.toString()).path,
          //   filename: Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).license_image!.paths.single!.split("/").last.toString(),),
          'engineering_office_name':engineering_office_name,
          'engineer_name':engineer_name,
          'engineer_phone_email':engineer_phone_email,
          // 'architectural_plan': await MultipartFile.fromFile(
          //   File(Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).PDF1!.paths.last.toString()).path,
          //     filename: Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).PDF1!.paths.single!.split("/").last.toString(),),
          // 'structural_plan':await MultipartFile.fromFile(
          //   File(Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).PDF2!.paths.last.toString()).path,
          //   filename: Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).PDF2!.paths.single!.split("/").last.toString(),),
          // 'electrical_diagram':await MultipartFile.fromFile(
          //   File(Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).PDF3!.paths.last.toString()).path,
          //   filename: Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).PDF3!.paths.single!.split("/").last.toString(),),
          // 'mechanical_diagram':await MultipartFile.fromFile(
          //   File(Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).PDF4!.paths.last.toString()).path,
          //   filename: Provider.of<SectionProvider>(AppRouter.navKey.currentContext!,listen: false).PDF4!.paths.single!.split("/").last.toString(),),
        },

    );
    log(response.data.toString());
  }
  Future<SpecialConditionsModel> getSpecialConditions(String id)async{
    Response response = await dio.get("$basedUrl/special_conditions/$id",
      options: Options(
        headers: <String, dynamic>{
          "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
        },),
    );
    return SpecialConditionsModel.fromJson(response.data);
  }
}