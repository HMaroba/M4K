import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  String? emailErrorText;
  bool isLoading = false;

  void _resetPassword() {
    String email = emailController.text;

    // Validate email field
    if (email.isEmpty) {
      setState(() {
        emailErrorText = 'Email is required';
      });
    } else {
      setState(() {
        emailErrorText = null;
      });
    }

    // Proceed with registration if both fields are valid
    if (emailErrorText == null) {
      try {
        // Sign in the user with email and password
        setState(() {
          isLoading = true;
        });

        // FirebaseAuth.instance
        //     .signInWithEmailAndPassword(
        //   email: email,
        //   password: password,
        // )
        //     .then((userCredential) {
        // Clear fields
        emailController.clear();

        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            isLoading = false;
          });
        });

        // Navigate to dashboard or home screen
        Navigator.pushNamed(context, '/login');
        // }).catchError((error) {
        //   // Stop loading
        //   setState(() {
        //     isLoading = false;
        //   });
        //   // Handle login errors
        //   setState(() {
        //     loginErrorText =
        //         'Incorrect email or password'; // Set login error message
        //   });
        //   print('Login error: $error');
        // });
      } catch (e) {
        // Handle any other errors that occur during login
        print('Error occurred during login: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Enter your email address to recover your password',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60.0),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    emailErrorText = 'Email is required';
                  });
                } else {
                  setState(() {
                    emailErrorText = null;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter email address',
                errorText: emailErrorText,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(330, 42),
                ),
              ),
              onPressed: isLoading ? null : _resetPassword,
              child: isLoading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 19,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      ],
                    )
                  : const Text('Recover Password',
                      style: TextStyle(fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
