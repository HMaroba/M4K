import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:m4k/screens/auth/login.dart';
import 'package:m4k/screens/auth/register.dart';
import 'package:m4k/screens/auth/reset_password.dart';
import 'package:m4k/screens/customerDashboard/book.dart';
import 'package:m4k/screens/customerDashboard/customer_dashboard.dart';
import 'package:m4k/screens/splash/secondScreen.dart';
import 'package:m4k/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/secondSplash': (context) => const SecondSplash(),
        '/login': (context) => const LoginScreen(),
        '/userdashboard': (context) => const DashboardPage(),
        '/book': (context) => const BookingScreen(),
        '/resetPassword': (context) => const ResetPasswordScreen(),
      },
    );
  }
}
