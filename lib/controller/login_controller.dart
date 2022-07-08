import 'package:budget_tracker_ui/repository/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  bool isLogin = false;
  LoginRepo loginRepo = LoginRepo();

  void loginVerify() {}
  Future<bool> login(String email, String password) async {
    isLogin = await loginRepo.login(email, password);
    return isLogin;
  }

  Future<bool> register(String name, String email, String password) async {
    isLogin = await loginRepo.register(name, email, password);
    return isLogin;
  }
}
