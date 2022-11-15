import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/Screens/AboutUs/AboutUsprovider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

import '../../../AppRouter.dart';
import '../../ColorUi.dart';

class ConditionsScreen extends StatelessWidget {
   ConditionsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AboutUsProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            title: Text('الشروط والاحكام',style: TextStyle(fontSize: 18.sp),),
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
          ),
          body:  SingleChildScrollView(
            child: (provider.loading)
                ?SizedBox(height:1.sh,child: Center(child: LoadingWidget()))
                :Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    '''
                    ${provider.conditions}
                    '''
        ),
                  InkWell(
                    onTap: (){
                      AppRouter.popFromWidget();
                    },
                    child: Container(
                      height: 48.h,
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:  ColorUi.mainColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            offset: Offset(0, 3),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Text('لقد قرأت الشروط',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                    ),
                  ),
                ],
              ),

            ),
          ),
        );
      }
    );
  }
}
