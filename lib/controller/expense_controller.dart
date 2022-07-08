import 'dart:math';

import 'package:budget_tracker_ui/constant.dart';
import 'package:budget_tracker_ui/models/expense_category_model.dart';
import 'package:budget_tracker_ui/repository/expense_repo.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController{
  bool isApiCalling=false;
  ExpenseRepo expenseRepo=ExpenseRepo();
  List<ExpenseCategoryModel> expenseCategoryList= <ExpenseCategoryModel>[];

  Future getCategoryList()async{
    expenseCategoryList=[];
    print("get Category Api Call");

    isApiCalling=true;

    expenseCategoryList=await expenseRepo.getExpenseCategory();

    print('#######${expenseCategoryList.length}');
    isApiCalling=false;
    update(['getExpenseCategory']);
  }
}