import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/Screens/Home/HomeProvider.dart';
import 'package:provider/provider.dart';

import '../../../ColorUi.dart';
import '../../../Widgets/RadioButtonWidget.dart';



class Accessory extends StatelessWidget {
  const Accessory({Key? key}) : super(key: key);

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
                          "ملحق الشروط الخاصة",
                        )),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text('تكون تكاليف تسوية الأرض والحفر للقواعد والخزان والبيارة على '),
                                RadioButtonWidget(),
                                Divider(),
                                Text('تكون تكاليف الدفان على'),
                                RadioButtonWidget(),
                                Divider(),
                                Text('تكاليف المياه للموقع على'),
                                RadioButtonWidget(),
                                Divider(),
                                Text('إحضار عامل للرش بصفة دائمة في الموقع لحين إنهاء عمل المقاول'),
                                RadioButtonWidget(),
                                Divider(),
                                Text(' تطليع المونة أو الاسمنت أو الرمل أو البلوك أو خلافه إلى مكان العمل'),
                                RadioButtonWidget(),
                                InkWell(
                                  onTap: (){
                                    Provider.of<HomeProvider>(context,listen: false).OpenedDetails();
                                    log(Provider.of<HomeProvider>(context,listen: false).openDetails.toString());

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
