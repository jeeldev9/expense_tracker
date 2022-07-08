import 'package:budget_tracker_ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepo {
  Future<bool> login(String email, String password) async {
    try {
      GotrueSessionResponse res =
          await supabase.auth.signIn(email: email, password: password);
      if (res.error != null) {
        if (res.error.statusCode == null) {
          Get.snackbar('', '',
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              titleText: Text(
                "'Invalid Credential",
                style: TextStyle(color: Colors.white),
              ),
              messageText: Text(
                'Please check email or password',
                style: TextStyle(color: Colors.white),
              ));
          return false;
        }
      }
      return true;
    } catch (e) {
      print("--------error $e");
      return false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      GotrueSessionResponse res = await supabase.auth.signUp(
        email,
        password,
        userMetadata: {'name': name},
      );
      if (res.error != null) {
        String message = res.error.message.toString();
        if (message == "User already registered") {
          Fluttertoast.showToast(msg: "User already registered");
          return false;
        } else if (message == "Password should be at least 6 characters") {
          Fluttertoast.showToast(
              msg: "Password should be at least 6 characters");
          return false;
        }
      }

      return true;
    } catch (e) {
      print("--------error $e");
      return false;
    }
  }
}
