import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  String? emailErrorText;
  String? passwordErrorText;
  String? loginErrorText; // New variable for login error message
  bool isLoading = false;

  void _login() {
    String email = emailController.text;
    String password = passwordController.text;

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

    // Validate password field
    if (password.isEmpty) {
      setState(() {
        passwordErrorText = 'Password is required';
      });
    } else {
      setState(() {
        passwordErrorText = null;
      });
    }

    // Proceed with registration if both fields are valid
    if (emailErrorText == null && passwordErrorText == null) {
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
        passwordController.clear();

        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            isLoading = false;
          });
        });

        // Navigate to dashboard or home screen
        Navigator.pushNamed(context, '/userdashboard');
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/user.png',
              height: 150,
            ),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
              ),
              // style: Theme.of(context).textTheme.displayMedium
              //
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
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: _obscureText,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    passwordErrorText = 'Password is required';
                  });
                } else {
                  setState(() {
                    passwordErrorText = null;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter password',
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                errorText: passwordErrorText,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              loginErrorText ??
                  '', // Show login error message if it's not null, otherwise show an empty string
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/resetPassword');
              },
              child: Container(
                width: double.infinity, // Set the container's width to expand
                alignment: Alignment.centerRight, // Align the text to the right
                child: const Text(
                  'Forgot password ?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(310, 42),
                ),
              ),
              onPressed: isLoading ? null : _login,
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
                  : const Text('Login', style: TextStyle(fontSize: 16.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Do not have an account yet ?',
                  style: TextStyle(fontSize: 15.0),
                ),
                TextButton(
                  child: const Text(
                    'Join now',
                    style: TextStyle(color: Colors.pink, fontSize: 17.0),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
