import 'package:flutter/material.dart';

class FirstSreenSplash extends StatefulWidget {
  const FirstSreenSplash({super.key});

  @override
  State<FirstSreenSplash> createState() => _FirstSreenSplashState();
}

class _FirstSreenSplashState extends State<FirstSreenSplash> {
  @override
  void initState() {
    super.initState();
    _navigateToSecondScreen();
  }

  Future<void> _navigateToSecondScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, '/splash');
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
            ClipOval(
              child: Image.asset(
                'assets/images/logo.jpg',
                height: 200,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
