import 'package:flutter/material.dart';
import 'package:m4k/screens/auth/login.dart';
import 'package:m4k/screens/auth/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
