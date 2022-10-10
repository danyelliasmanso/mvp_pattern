import 'package:flutter/material.dart';
import 'package:mvp_pattern/home/home_page.dart';
import 'package:mvp_pattern/login/page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVP Pattern',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:{
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
