import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/ColorUi.dart';
import 'package:khaltah/Features/Screens/Home/Section/SectionProvider.dart';
import 'package:khaltah/Features/Widgets/FileButton.dart';
import 'package:khaltah/Features/Widgets/TextFieldWidget.dart';
import 'package:khaltah/Models/AllSectionsModel.dart';
import 'package:provider/provider.dart';

import '../../HomeProvider.dart';




class Document extends StatelessWidget {
  // const Document({Key? key}) : super(key: key);
  Section section;
  Document({required this.section});

  @override
  Widget build(BuildContext context) {
    return Consumer<SectionProvider>(
      builder: (context,provider,x) {
        return ExpandableNotifier(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment: ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "وثيقة العقدالاساسية",
                            )),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child:
                                Column(
                                  children:  [
                                    TextFieldWidget(hintText: 'رقم بطاقة الأحوال',
                                      controller: provider.id_card_numberController,),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'تاريخ بطاقة الأحوال',
                                      textInputType: TextInputType.datetime,
                                      controller: provider.id_card_dateController,),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'مصدر بطاقة الأحوال',
                                      controller: provider.status_card_issuerController,),
                                    SizedBox(height: 8.h,),
                                    // TextFieldWidget(hintText: 'صورة بطاقة الأحوال',),
                                    GestureDetector(
                                      onTap: (){
                                        provider.filePicker('status_card_image');
                                      },
                                      child: FileButton(content: 'صورة بطاقة الأحوال', file: provider.status_card_image),
                                    ),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'رقم الصك',controller: provider.Instrument_noController,),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'تاريخ الصك',
                                      textInputType: TextInputType.datetime,
                                      controller: provider.Instrument_dateController,),
                                    SizedBox(height: 8.h,),
                                    // TextFieldWidget(hintText: 'صورة الصك'),
                                    GestureDetector(
                                      onTap: (){
                                        provider.filePicker('Instrument_image');
                                      },
                                      child: FileButton(content: 'صورة الصك', file: provider.Instrument_image),
                                    ),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'رقم ترخيص البناء',
                                      controller: provider.building_permit_numberController,),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'تاريخ الترخيص',
                                      textInputType: TextInputType.datetime,
                                      controller: provider.license_dateController,),
                                    SizedBox(height: 8.h,),
                                    // TextFieldWidget(hintText: 'صورة الترخيص'),
                                    GestureDetector(
                                      onTap: (){
                                        provider.filePicker('license_image');
                                      },
                                      child: FileButton(content: 'صورة الترخيص', file: provider.license_image),
                                    ),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'اسم المكتب الهندسي',
                                      controller: provider.engineering_office_nameController,),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'اسم المهندس المشرف',
                                      controller: provider.engineer_nameController,),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'رقم جوال او ايميل المهندس المشرف',
                                      controller: provider.engineer_phone_emailController,),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'رقم القرار المساحي',
                                      controller: provider.cadastral_numberController,),
                                    SizedBox(height: 8.h,),
                                    TextFieldWidget(hintText: 'اسم الحي',
                                      controller: provider.neighborhoodController,),
                                    SizedBox(height: 8.h,),
                                    GestureDetector(
                                      onTap: (){
                                        provider.filePicker('cadastral_number_image');
                                      },
                                      child: FileButton(content: 'صورة القرار المساحي', file: provider.cadastral_number_image),
                                    ),
                                    SizedBox(height: 8.h,),
                                    GestureDetector(
                                      onTap: (){
                                        provider.filePicker('soil_report_image');
                                      },
                                      child: FileButton(content: 'تقرير التربة', file: provider.soil_report_image),
                                    ),
                                    SizedBox(height: 8.h,),
                                    GestureDetector(
                                      onTap: (){
                                        provider.filePicker('approved_bill_of_quantities_image');
                                      },
                                      child: FileButton(content: ' الكميات المعتمدة', file: provider.approved_bill_of_quantities_image),
                                    ),
                                    SizedBox(height: 8.h,),
                                    GestureDetector(
                                      onTap: (){
                                        provider.filePicker('PDF1');
                                      },
                                      child: FileButton(content: 'المخطط المعماري', file: provider.PDF1),
                                    ),
                                    SizedBox(height: 8.h,),
                                    GestureDetector(
                                      onTap: (){
                                        provider.filePicker('PDF2');
                                      },
                                      child: FileButton(content: 'المخطط الإنشائي', file: provider.PDF2),
                                    ),
                                    SizedBox(height: 8.h,),
                                    GestureDetector(
                                      onTap: (){
                                        provider.filePicker('PDF3');
                                      },
                                      child: FileButton(content: 'المخطط الكهربائي', file: provider.PDF3),
                                    ),
                                    SizedBox(height: 8.h,),
                                    GestureDetector(
                                      onTap: (){
                                        provider.filePicker('PDF4');
                                      },
                                      child: FileButton(content: 'المخطط الميكانيكي', file: provider.PDF4),
                                    ),
                                    SizedBox(height: 10.h,),
                                    provider.openAccessory != true?
                                    InkWell(
                                      onTap: (){



                                        Provider.of<SectionProvider>(context,listen: false).contractsStore(
                                            section.projectId.toString(),
                                            section.id.toString());
                                        // log(provider.PDF4?.paths.last.toString()??'');
                                        // log(provider.construction_type);

                                        // Provider.of<SectionProvider>(context,listen: false).OpenedAccessory();
                                        log(Provider.of<SectionProvider>(context,listen: false).openAccessory.toString());
                                        // log(provider.Instrument_image?.names.toString()??"no file");
                                      },
                                      child: Container(
                                        height: 48.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color:  ColorUi.mainColor,
                                          borderRadius: BorderRadius.circular(10),

                                        ),
                                        child:
                                            provider.loading ? CircularProgressIndicator(color: Colors.white,) :
                                        Text('حفظ ومتابعة',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                                      ),
                                    ) : SizedBox(),
                                  ],
                                )
                              // Text(
                              //   loremIpsum,
                              //   softWrap: true,
                              //   overflow: TextOverflow.fade,
                              // )
                            ),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme: const ExpandableThemeData(crossFadePoint: 1),
                            ),
                          );
                        }, collapsed: SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      }
    );
  }
}


