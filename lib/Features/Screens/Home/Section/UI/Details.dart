
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Home/Section/SectionProvider.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../ColorUi.dart';


class Details extends StatelessWidget {
   Details({Key? key}) : super(key: key);
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<SectionProvider>(
      builder: (context,provider,x) {
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
                              "المواصفات الفنية / التفاصيل ",style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child:
                                Column(
                                  children:  [
                                    SizedBox(
                                      height: .5.sh,
                                        child: SfPdfViewer.network(
                                            "${API.imageUrl}${provider.pathPDFContracts}",
                                          scrollDirection: PdfScrollDirection.horizontal,

                                        )),

                                    InkWell(
                                      onTap: (){
                                        AppRouter.popFromWidget();
                                        provider.openDocument = true;
                                        provider.openSpecialConditions = false;
                                        provider.openDetails = false;

                                        provider.id_card_numberController.clear();
                                        provider.id_card_dateController.clear();
                                        provider.status_card_issuerController.clear();
                                        provider.Instrument_noController.clear();
                                        provider.Instrument_dateController.clear();
                                        provider.building_permit_numberController.clear();
                                        provider.license_dateController.clear();
                                        provider.engineering_office_nameController.clear();
                                        provider.engineer_nameController.clear();
                                        provider.engineer_phone_emailController.clear();
                                        provider.cadastral_numberController.clear();
                                        provider.neighborhoodController.clear();
                                        provider.status_card_image=null;
                                        provider.Instrument_image=null;
                                        provider.license_image=null;
                                        provider.cadastral_number_image=null;
                                        provider.soil_report_image=null;
                                        provider.approved_bill_of_quantities_image=null;
                                        provider.PDF1=null;
                                        provider.PDF2=null;
                                        provider.PDF3=null;
                                        provider. PDF4=null;
                                        provider.notifyListeners();
                                        // log("${API.imageUrl}${Provider.of<SectionProvider>(context,listen: false).pathPDFContracts}");

                                      },
                                      child: Container(
                                        height: 48.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color:  ColorUi.mainColor,
                                          borderRadius: BorderRadius.circular(10),

                                        ),
                                        child: Text('تم بنجاح',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
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
    );
  }
}
