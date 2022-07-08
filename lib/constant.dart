import 'package:budget_tracker_ui/controller/expense_controller.dart';
import 'package:budget_tracker_ui/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

LoginController loginController = Get.put(LoginController());
ExpenseController expenseController;

SupabaseClient supabase;
Session session;
User user;
