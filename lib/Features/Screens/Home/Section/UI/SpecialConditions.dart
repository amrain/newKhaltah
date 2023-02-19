import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:khaltah/Features/Screens/Home/HomeProvider.dart';
import 'package:khaltah/Models/AllSectionsModel.dart';
import 'package:provider/provider.dart';

import '../../../../ColorUi.dart';
import '../../../../Widgets/RadioButtonWidget.dart';
import '../SectionProvider.dart';



class SpecialConditions extends StatefulWidget {
  const SpecialConditions({Key? key}) : super(key: key);


  @override
  State<SpecialConditions> createState() => _SpecialConditionsState();
}

class _SpecialConditionsState extends State<SpecialConditions> {
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
                              "ملحق الشروط الخاصة",style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: provider.questions.length,
                                      itemBuilder: (context, indexQ) {
                                        return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              SizedBox(height: 5.h,),
                                              Text(provider.questions[indexQ].question??''),
                                              SizedBox(height: 10.h,),
                                              GroupButton(
                                                isRadio: true,
                                                onSelected: (indexA, isSelected,f){
                                                  Map<String,dynamic> map = {
                                                    "contract_id" : int.parse(provider.idNewContracts!),
                                                    "question_id" : provider.questions[indexQ].id,
                                                    "answers" : provider.questions[indexQ].answers![isSelected].title.toString()
                                                  };
                                                  provider.mapAnswers[provider.questions[indexQ].id.toString()] = map;
                                                    // provider.answers.add(map);
                                                    // provider.answers[indexQ] = map;




                                                  print('${provider.questions[indexQ].id} id Question');
                                                  print('${provider.questions[indexQ].answers![isSelected].id} id Answer');
                                                } ,
                                                buttons: provider.questions[indexQ].answers!.map((e) {
                                                  return e.title;
                                                } ).toList(),
                                                options:GroupButtonOptions(
                                                  selectedShadow: const [],
                                                  selectedTextStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                  selectedColor: ColorUi.mainColor,
                                                  unselectedShadow: const [],
                                                  unselectedColor: Colors.white,
                                                  unselectedTextStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                  selectedBorderColor: ColorUi.mainColor,
                                                  unselectedBorderColor: ColorUi.mainColor,
                                                  borderRadius: BorderRadius.circular(15),
                                                  spacing: 10,
                                                  runSpacing: 10,
                                                  groupingType: GroupingType.wrap,
                                                  direction: Axis.vertical,
                                                  buttonHeight: 40.h,
                                                  buttonWidth: 120.w,
                                                  mainGroupAlignment: MainGroupAlignment.start,
                                                  crossGroupAlignment: CrossGroupAlignment.start,
                                                  groupRunAlignment: GroupRunAlignment.start,
                                                  textAlign: TextAlign.center,
                                                  textPadding: EdgeInsets.zero,
                                                  alignment: Alignment.center,
                                                  elevation: 0,
                                                )
                                              ),
                                              SizedBox(height: 10.h,),
                                              Divider(),

                                            ],
                                          );
                                      }),

                            ),
                            InkWell(
                              onTap: (){
                                provider.storeSpecialConditions();
                                Provider.of<SectionProvider>(context,listen: false).OpenedDetails();
                                log(Provider.of<SectionProvider>(context,listen: false).openDetails.toString());
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
