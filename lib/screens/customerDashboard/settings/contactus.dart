import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String? emailErrorText;
  String? messageErrorText;
  String? phoneErrorText;

  bool isLoading = false;

  void _login() {
    String email = emailController.text;
    String message = messageController.text;
    String phone = phoneController.text;

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
    if (phone.isEmpty) {
      setState(() {
        phoneErrorText = 'Phone number is required';
      });
    } else if (phone.length != 8) {
      setState(() {
        phoneErrorText = 'Phone number must be 8 digits';
      });
    } else {
      setState(() {
        phoneErrorText = null;
      });
    }

    // Validate password field
    if (message.isEmpty) {
      setState(() {
        messageErrorText = 'Message is required';
      });
    } else {
      setState(() {
        messageErrorText = null;
      });
    }

    // Proceed with registration if both fields are valid
    if (emailErrorText == null &&
        messageErrorText == null &&
        phoneErrorText == null) {
      try {
        // Sign in the user with email and password
        setState(() {
          isLoading = true;
        });

        Navigator.pop(context);

        // Clear fields
        emailController.clear();
        messageController.clear();
        phoneController.clear();

        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            isLoading = false;
          });
        });

        // Navigate to dashboard or home screen
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
          children: [
            const SizedBox(height: 200.0),
            const Text(
              'Contact US',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
              ),

              //
            ),
            const SizedBox(height: 40.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.email,
                  size: 30,
                  color: Colors.pink,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'm4k@gmail.co.ls',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.phone,
                  size: 30,
                  color: Colors.pink,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '+266 63338813 / +266 58511867',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    phoneErrorText = 'Phone number is required';
                  });
                } else if (value.length != 8) {
                  setState(() {
                    phoneErrorText = 'Phone number must be 8 digits long';
                  });
                } else {
                  setState(() {
                    phoneErrorText = null;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                errorText: phoneErrorText,
              ),
            ),
            const SizedBox(height: 16.0),
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
              controller: messageController,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    messageErrorText = 'Message is required';
                  });
                } else {
                  setState(() {
                    messageErrorText = null;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Message',
                hintText: 'Enter Message or Suggestion',
                errorText: messageErrorText,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(350, 42),
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
                  : const Text('Submit', style: TextStyle(fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
