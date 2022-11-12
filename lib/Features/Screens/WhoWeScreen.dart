import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../ColorUi.dart';
import '../Widgets/TextFieldWidget.dart';

class WhoWeScreen extends StatelessWidget {
   WhoWeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('من نحن',style: TextStyle(fontSize: 18.sp),),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 15.h,),
                SvgPicture.asset('assets/images/logo.svg',height: 80.h,),
                SizedBox(height: 30.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 130.w,
                      padding: EdgeInsets.all(8),
                      height: 40.h,
                      // width: MediaQuery.of(context).size.width/2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:  Color(0xffEEF7FC),
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      ),
                      child: const Text('نبذه تعريفيه',
                        style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Text(content,style: TextStyle(height: 1.5),),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 130.w,
                      padding: EdgeInsets.all(8),
                      height: 40.h,
                      // width: MediaQuery.of(context).size.width/2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:  Color(0xffEEF7FC),
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      ),
                      child: const Text('معلومات التواصل',
                        style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/images/تويتر.svg',height: 40.h,),
                    SvgPicture.asset('assets/images/انستا.svg',height: 40.h,),
                    SvgPicture.asset('assets/images/واتس.svg',height: 40.h,),
                    SvgPicture.asset('assets/images/ايميل.svg',height: 40.h,),
                  ],
                ),
                SizedBox(height: 20.h,),


              ],
            ),
          ),
        ),
      ),
    );
  }

  String content ='''
  نفخر بأنفسنا في "مؤسسة خلطه للمقاولات العامة"، لأننا نقدم لعملائنا أكثر مما يتوقعون، إذا كانت لديك جميع المخططات الانشائية والمعمارية، وأنت مستعد للبناء والتعاقد مع مقاول عام، فنحن هنا أفضل رهان لك لإنجاز المهمة وتنفيذ مشروع فريد من نوعه لك وفق معايير عالمية وطبقاً لأنظمة الهيئات الحكومية المعنية.
تمنحنا خبرتنا كمقاول عام القدرة على انتاج المشاريع بأفضل جودة بدءاً من استلام المشروع، والتنفيذ حتى تسليم المشروع.
يكمن هدفنا الأساسي في تقديم مجموعة متنوعة من الخدمات عالية الجودة في خدمات البناء والتشييد والتشطيبات الشاملة للمشاريع في أي مكان داخل السعودية ابتداءً من مدينة حائل.
نحن نملك فريق عمل وشركاء من المحترفين المتمرسين والخبراء، تم اختيارهم وفق خبرتهم السابقة في تنفيذ الأعمال، لنجلب الابتكار والتطوير إلى أعمال البناء والتشطيبات وتقديم مجموعة واسعة من الأعمال وتسليم مشروعك ضمن الإطار الزمني المحدد والميزانية المقدمة بالاعتماد على متطلبات واحتياجات العميل.
كما نقدم لعملائنا الكرام خدمة العقود الإلكترونية ومتابعة الأعمال بالصور الفوتوغرافية، لكي يتسنى لكل عميل الاطلاع على جميع الأعمال المنفذة على جميع العقود الموقعة الكترونياً على التطبيق كل عقد وكل عمل على حدة، إضافة لذلك تقديم خدمة برنت كامل بالأعمال المقدمة على العقود المنفذة وتشمل (العقود، الصور الفوتوغرافية، الفواتير المحفوظة).
وأخيراً نقدم لك خدمة المخالصة النهائية لضمان حق العميل وحق "مؤسسة خلطه للمقاولات العامة"، وتتيح هذه الخدمة ضمان حق العميل من ناحية الأعمال المنفذة له، وأيضا تتيح لـ "مؤسسة خلطه للمقاولات العامة" ضمان حقوقها المالية، وإنهاء التعاقد بين العميل والمؤسسة بكل سهولة ومرونة.
أنتم سبب لنجاحنا نحن ممتنون للغاية لتعاملكم معنا، وسوف نبذل قصارى جهدنا لتقديم الخدمة التي تستحقونها، ونأمل أن نحقق كافة توقعاتكم

  ''' ;
}
