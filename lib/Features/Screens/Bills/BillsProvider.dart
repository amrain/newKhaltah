import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/BillsHelper.dart';
import 'package:khaltah/Models/BillsModel.dart';

class BillsProvider extends ChangeNotifier {

  bool loading = false;
  List<Bill> bills =[];

  getBills (int idContract)async{
    try{
      loading = true;
      notifyListeners();
      BillsModel billsModel =
          await BillsHelper.billsHelper.BillShow(idContract);
      bills = billsModel.data!;
      loading = false;
      notifyListeners();
    }
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }

}