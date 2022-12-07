import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Screens/Home/Section/SectionProvider.dart';
import 'package:khaltah/Features/Screens/Home/Section/UI/Details.dart';
import 'package:khaltah/Features/Screens/Home/Section/UI/Document.dart';
import 'package:khaltah/Models/AllSectionsModel.dart';
import 'package:khaltah/Features/ColorUi.dart';
import 'package:khaltah/Features/Screens/Home/HomeProvider.dart';
import 'package:khaltah/Features/Widgets/TextFieldWidget.dart';
import 'package:provider/provider.dart';

import 'SpecialConditions.dart';

class SectionScreen extends StatefulWidget {
   SectionScreen({Key? key}) : super(key: key);

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}
enum Material {withMaterial,withoutMaterial}
class _SectionScreenState extends State<SectionScreen> {

  List<String> project = [
    'فيلا',
    'عمارة',
    'دور أرضي',
    'دوبليكس',
    'شاليهات',
    'استراحات',
  ];

  bool newsExpanded = false;
  bool weatherExpanded = false;

  int selected = 0;
  bool open = false ;
  Material? _material = Material.withMaterial;
  late Section thisSection ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('المشاريع السكنية',style: TextStyle(fontSize: 18.sp),),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Consumer<SectionProvider>(
          builder: (context,provider,x) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 125.h,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                        childAspectRatio: 1.5),
                        itemCount: provider.sections.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selected = index;
                                open = true;
                                thisSection = provider.sections[index];
                                provider.getSpecialConditions(provider.sections[index].id.toString());
                                log(thisSection.id.toString());
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: selected==index ? ColorUi.mainColor : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: ColorUi.mainColor
                                )
                              ),
                              child: Text(provider.sections[index].name??"",
                                style: TextStyle(color:  selected==index ? Colors.white : Colors.black,
                                  fontWeight:  selected==index ? FontWeight.bold : FontWeight.normal,
                                ),),
                            ),
                          );
                        }),
                  ),
                ),
                open?
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1,-1),
                            color: Colors.grey,
                            blurRadius: 1,
                          )
                        ]
                    ),
                    child:SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xffEEF7FC),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset('assets/images/Group979.svg',height: 30.h,),
                                    Text(" "+'001244')
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(children: [
                                Radio<Material>(
                                  value: Material.withMaterial,
                                  groupValue: _material,
                                  activeColor: ColorUi.mainColor,
                                  onChanged: (Material? value) {
                                    setState(() {
                                      _material = value;
                                      provider.construction_type = '1';
                                    });
                                  },
                                ),
                                Text('البناء بالمواد',style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),),
                              ],
                              ),
                              Row(children: [
                                Radio<Material>(
                                  value: Material.withoutMaterial,
                                  groupValue: _material,
                                  activeColor: ColorUi.mainColor,
                                  onChanged: (Material? value) {
                                    setState(() {
                                      _material = value;
                                      provider.construction_type = '0';
                                    });
                                  },
                                ),
                                Text('البناء بدون مواد',style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),)
                              ],),
                            ],

                          ),
                          Document(section: thisSection,),
                          provider.openAccessory?
                          SpecialConditions():
                          InkWell(
                            onTap: (){
                              AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'مطلوب',
                                  desc: 'يرجى تعبئة وثيقة العقد الاساسية',
                              btnOkText: 'موافق',
                              btnOkOnPress: () {},
                              ).show();

                            },
                            child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Card(
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "ملحق الشروط الخاصة",
                                                ),
                                                Icon(Icons.keyboard_arrow_down,color: Colors.black54,)
                                              ],
                                            ),
                                            SizedBox(height: 8.h,)
                                          ],
                                        )),
                                  ),
                                ),
                          ),
                          provider.openDetails?
                          Details():
                          InkWell(
                            onTap: (){
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'مطلوب',
                                desc: 'يرجى تعبئة ملحق الشروط الخاصة',
                                btnOkText: 'موافق',
                                btnOkOnPress: () {},
                              ).show();

                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "المواصفات الفنية / التفاصيل ",
                                            ),
                                            Icon(Icons.keyboard_arrow_down,color: Colors.black54,)
                                          ],
                                        ),
                                        SizedBox(height: 8.h,)
                                      ],
                                    )),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ) : SizedBox()
              ],
            );
          }
        ),
      ),
    );
  }
}
