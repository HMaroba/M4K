import 'package:flutter/material.dart';

class SendFeedbackPage extends StatefulWidget {
  const SendFeedbackPage({super.key});

  @override
  State<SendFeedbackPage> createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedbackPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String? emailErrorText;
  String? messageErrorText;
  String? loginErrorText; // New variable for login error message
  bool isLoading = false;

  void _login() {
    String email = emailController.text;
    String message = messageController.text;

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
    if (emailErrorText == null && messageErrorText == null) {
      try {
        // Sign in the user with email and password
        setState(() {
          isLoading = true;
        });

        Navigator.pop(context);

        // Clear fields
        emailController.clear();
        messageController.clear();

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Send Feedback',
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
                  : const Text('Submit', style: TextStyle(fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
