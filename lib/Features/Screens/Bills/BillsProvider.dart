import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/BillsHelper.dart';
import 'package:khaltah/Models/BillsModel.dart';

class BillsProvider extends ChangeNotifier {

  bool loading = false;
  List<Bill> bills =[];

  getBills (int idContract)async{
    loading = true;
    notifyListeners();
    BillsModel billsModel = await BillsHelper.billsHelper.BillShow(idContract);
    bills = billsModel.data!;
    loading = false;
    notifyListeners();

  }

}