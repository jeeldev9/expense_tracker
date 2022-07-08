import 'package:budget_tracker_ui/constant.dart';
import 'package:budget_tracker_ui/controller/expense_controller.dart';
import 'package:budget_tracker_ui/repository/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  bool isLogin = false;
  bool isApiCalling=false;
  bool isUserLogin=true;
  LoginRepo loginRepo = LoginRepo();

  void loginVerify() {
    if (supabase.auth.user() != null) {
      user = supabase.auth.user();
      isUserLogin=true;
      expenseController = Get.put(ExpenseController());
    }else{
      user=null;
      isUserLogin=false;
    }
  }


  Future<bool> login(String email, String password) async {

    isApiCalling=true;
    update(['loginButton']);
    isLogin = await loginRepo.login(email, password);
    if(isLogin){
      expenseController = Get.put(ExpenseController());
    }
    isApiCalling=false;
    update(['loginButton']);
    return isLogin;
  }

  Future<bool> register(String name, String email, String password) async {
    isApiCalling=true;
    update(['registerButton']);
    isLogin = await loginRepo.register(name, email, password);
    isApiCalling=false;
    update(['registerButton']);
    return isLogin;
  }


}
