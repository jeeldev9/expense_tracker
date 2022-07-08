import 'package:budget_tracker_ui/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

LoginController loginController = Get.put(LoginController());

SupabaseClient supabase;
Session session;
User user;
