import 'package:flutter/material.dart';
import 'package:m4k/screens/auth/login.dart';
import 'package:m4k/screens/auth/register.dart';
import 'package:m4k/screens/customerDashboard/customer_dashboard.dart';
import 'package:m4k/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

final customColor = Color.fromRGBO(255, 87, 51, 1.0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          // fontFamily: 'Georgia',
          fontFamily: 'OpenSans'),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginScreen(),
        '/userdashboard': (context) => const DashboardPage(),
      },
    );
  }
}
