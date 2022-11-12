import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../ColorUi.dart';


class Details extends StatelessWidget {
   Details({Key? key}) : super(key: key);
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child:
            Column(
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
                          "المواصفات الفنية / التفاصيل ",
                        )),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child:
                            Column(
                              children:  [

                                InkWell(
                                  onTap: (){

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
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    }, collapsed: SizedBox(),
                  ),
                ),
              ],
            )


          ),
        ));
  }
}
