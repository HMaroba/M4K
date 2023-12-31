import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToSecondScreen();
  }

  Future<void> _navigateToSecondScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, '/secondSplash');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pink,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bookNow.png',
              height: 200,
            ),
            const SizedBox(
              height: 35.0,
            ),
            const Text(
              "M4K LAUNDRY SERVICES",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}
