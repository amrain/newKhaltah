import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/ColorUi.dart';


enum Costs {owner,contractor}

class RadioButtonWidget extends StatefulWidget {
   RadioButtonWidget({Key? key}) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  Costs? _costs = Costs.owner;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Radio<Costs>(
            value: Costs.owner,
            groupValue: _costs,
            activeColor: ColorUi.mainColor,
            onChanged: (Costs? value) {
              setState(() {
                _costs = value;
              });
            },
          ),
          Text('المالك',style: TextStyle(
            fontSize: 15.sp,
            color: Colors.black,
          ),),
        ],
        ),
        Row(children: [
          Radio<Costs>(
            value: Costs.contractor,
            groupValue: _costs,
            activeColor: ColorUi.mainColor,
            onChanged: (Costs? value) {
              setState(() {
                _costs = value;
              });
            },
          ),
          Text('المقاول',style: TextStyle(
            fontSize: 15.sp,
            color: Colors.black,
          ),)
        ],),
      ],

    );
  }
}
