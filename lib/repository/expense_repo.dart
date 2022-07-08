import 'dart:convert';

import 'package:budget_tracker_ui/constant.dart';
import 'package:budget_tracker_ui/models/expense_category_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExpenseRepo{


  Future<List<ExpenseCategoryModel>> getExpenseCategory()async{
    try{
      PostgrestResponse res=await supabase.from('expenses_category').select().execute();
      if(res.error!=null){
        Fluttertoast.showToast(msg: "${res.error.message}");
      }
      List<ExpenseCategoryModel> listOfData=[];
      for(var i in res.data){
        listOfData.add(ExpenseCategoryModel.fromJson(i));
      }
       return listOfData;

    }catch(e){
      print('*******error********$e');
      return [];
    }
  }
}