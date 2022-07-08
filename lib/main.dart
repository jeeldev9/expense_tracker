import 'package:budget_tracker_ui/constant.dart';
import 'package:budget_tracker_ui/pages/login_screen.dart';
import 'package:budget_tracker_ui/pages/register_page.dart';
import 'package:budget_tracker_ui/pages/root_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://chryrpyqrxmypksvarit.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNocnlycHlxcnhteXBrc3Zhcml0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTcwMDgxNzEsImV4cCI6MTk3MjU4NDE3MX0.9BvpEHHW5gAKawqcEEZaDCIbx4Psui12d2l5TWT6-p0',
  );

  supabase = Supabase.instance.client;

  if (supabase.auth.user() != null) {
    user = supabase.auth.user();
  }

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/': (context) =>
          supabase.auth.currentUser != null ? RootApp() : LoginScreenOne(),
      '/rootApp': (context) => RootApp(),
      '/register': (context) => RegisterScreen(),
      '/login': (context) => LoginScreenOne(),
    },
    // home: loginController.isLogin ? RootApp() : LoginScreenOne(),
  ));
}
