import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../ColorUi.dart';
import '../../../Widgets/TextFieldWidget.dart';
import '../HomeProvider.dart';


class Document extends StatelessWidget {
  const Document({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                TextFieldWidget(hintText: 'رقم بطاقة الأحوال'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'تاريخ بطاقة الأحوال'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'مصدر بطاقة الأحوال'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'صورة بطاقة الأحوال'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'رقم الصك'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'تاريخ الصك'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'صورة الصك'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'رقم ترخيص البناء'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'تاريخ الترخيص'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'صورة الترخيص'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'اسم المكتب الهندسي'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'اسم المهندس المشرف'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'رقم جوال او ايميل المهندس المشرف'),
                                SizedBox(height: 8.h,),
                                TextFieldWidget(hintText: 'صور المخطط الانشائي المعماري وتقرير التربة'),
                                SizedBox(height: 10.h,),
                                InkWell(
                                  onTap: (){
                                    Provider.of<HomeProvider>(context,listen: false).OpenedAccessory();
                                    log(Provider.of<HomeProvider>(context,listen: false).openAccessory.toString());
                                  },
                                  child: Container(
                                    height: 48.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:  ColorUi.mainColor,
                                      borderRadius: BorderRadius.circular(10),

                                    ),
                                    child: Text('حفظ ومتابعة',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                                  ),
                                ),
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
}
