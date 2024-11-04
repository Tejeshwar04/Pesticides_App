// main.dart

import 'package:flutter/material.dart';
import 'logo_page.dart';
import 'select_language_page.dart';
import 'login_page.dart';
import 'create_account_page.dart';
import 'dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesticide Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LogoPage(),
        '/select-language': (context) => SelectLanguagePage(),
        '/login': (context) => LoginPage(),
        '/create-account': (context) => CreateAccountPage(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
