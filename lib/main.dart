import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:m4k/screens/adminDashboard/admin_dashboard.dart';
import 'package:m4k/screens/adminDashboard/admin_profile.dart';
import 'package:m4k/screens/adminDashboard/allbookings.dart';
import 'package:m4k/screens/adminDashboard/settings.dart';
import 'package:m4k/screens/auth/login.dart';
import 'package:m4k/screens/auth/register.dart';
import 'package:m4k/screens/auth/reset_password.dart';
import 'package:m4k/screens/customerDashboard/book.dart';
import 'package:m4k/screens/customerDashboard/customer_dashboard.dart';
import 'package:m4k/screens/customerDashboard/profile.dart';
import 'package:m4k/screens/customerDashboard/settings/about.dart';
import 'package:m4k/screens/customerDashboard/settings/contactus.dart';
import 'package:m4k/screens/customerDashboard/settings/feedback.dart';
import 'package:m4k/screens/customerDashboard/settings/payments.dart';
import 'package:m4k/screens/customerDashboard/welcome.dart';
import 'package:m4k/screens/splash/firstScreen.dart';
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
        fontFamily: 'Georgia',
        // fontFamily: 'OpenSans'
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstSreenSplash(),
        '/splash': (context) => const SplashScreen(),
        '/register': (context) => const RegisterPage(),
        '/welcome': (context) => const WelcomeScreen(),
        '/admin': (context) => const AdminDashboard(),
        '/about': (context) => const AboutScreen(),
        '/profile': (context) => const UserProfileScreen(),
        '/secondSplash': (context) => const SecondSplash(),
        '/login': (context) => const LoginScreen(),
        '/userdashboard': (context) => const DashboardPage(),
        '/payments': (context) => const PaymentsScreen(),
        '/contact': (context) => const ContactUsScreen(),
        '/feedback': (context) => const SendFeedbackPage(),
        '/book': (context) => const BookingScreen(),
        '/resetPassword': (context) => const ResetPasswordScreen(),

        //ADMIN ROUTES

        '/allbookings': (context) => const CustomersBookingScreen(),
        '/adminprofile': (context) => const AdminProfileScreen(),
        '/adminSettings': (context) => const AdminSettings(),
      },
    );
  }
}
