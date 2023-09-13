import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController namesController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _obscureText = true;

  String? emailErrorText;
  String? passwordErrorText;
  String? namesErrorText;
  String? phoneErrorText;
  String? countryErrorText;
  String? locationErrorText;
  bool isLoading = false;

  Future<void> _register() async {
    String email = emailController.text;
    String password = passwordController.text;
    String names = namesController.text;
    String phone = phoneController.text;
    String location = locationController.text;

    // Validate email field
    if (email.isEmpty) {
      setState(() {
        emailErrorText = 'Email is required';
      });
    } else {
      setState(() {
        phoneErrorText = null;
      });
    }
    if (location.isEmpty) {
      setState(() {
        locationErrorText = 'Location is required';
      });
    } else {
      setState(() {
        locationErrorText = null;
      });
    }

    // Validate names field
    if (names.isEmpty) {
      setState(() {
        namesErrorText = 'Full names are required';
      });
    } else {
      setState(() {
        namesErrorText = null;
      });
    }

    // Validate names field
    if (phone.isEmpty) {
      setState(() {
        phoneErrorText = 'Phone number is required';
      });
    } else if (phone.length != 8) {
      phoneErrorText = 'Phone number should be 8 digits';
    } else {
      setState(() {
        phoneErrorText = null;
      });
    }

    // Validate password field
    if (password.isEmpty) {
      setState(() {
        passwordErrorText = 'Password is required';
      });
    } else if (password.length < 8) {
      setState(() {
        passwordErrorText = 'Password should be at least 8 characters long';
      });
    } else {
      setState(() {
        passwordErrorText = null;
      });
    }

    // Proceed with registration if both fields are valid
    if (emailErrorText == null &&
        passwordErrorText == null &&
        namesErrorText == null &&
        phoneErrorText == null &&
        locationErrorText == null &&
        countryErrorText == null) {
      try {
        //start loading
        setState(() {
          isLoading = true;
        });
        // // Create user with email and password
        // UserCredential userCredential =
        //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //   email: email,
        //   password: password,
        // );

        // Get the newly created user's ID
        // String userId = userCredential.user!.uid;
        // print(userId);
        //Create a map of the data you want to send

        // Map<String, dynamic> userData = {
        //   'email': email,
        //   'names': names,
        //   'phone': selectedCountry == "Lesotho" ? "+266$phone" : "+27$phone",
        //   'country': selectedCountry,
        //   'userId': userId,
        // };
        // Send the data to Firestore
        // await FirebaseFirestore.instance.collection('users').add(userData);

        // // Subscribe the user to the topic
        // FirebaseMessaging.instance.subscribeToTopic('all_users');

        // Clear fields
        emailController.clear();
        passwordController.clear();
        phoneController.clear();
        namesController.clear();
        locationController.clear();

        setState(() {
          isLoading = false; // Stop loading
        });

        // Fluttertoast.showToast(
        //   msg: "Account created Sucessfully",
        //   toastLength: Toast
        //       .LENGTH_SHORT, // Duration for which the toast will be visible
        //   gravity: ToastGravity
        //       .CENTER, // Position of the toast message on the screen
        //   backgroundColor:
        //       Colors.black54, // Background color of the toast message
        //   textColor: Colors.green, // Text color of the toast message
        // );
        // Navigate to login
        Navigator.pushNamed(context, '/loginpage');
      } catch (e) {
        // Handle any errors that occur during the data submission

        setState(() {
          isLoading = false; // Stop loading
        });

        print('Error submitting data: $e');
        // Fluttertoast.showToast(
        //   msg: "Something went wrong please try again",
        //   toastLength: Toast
        //       .LENGTH_SHORT, // Duration for which the toast will be visible
        //   gravity: ToastGravity
        //       .CENTER, // Position of the toast message on the screen
        //   backgroundColor:
        //       Colors.black54, // Background color of the toast message
        //   textColor: Colors.red, // Text color of the toast message
        // );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Create an Account"),
      //   centerTitle: true,
      // ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 150.0),
            const Text(
              'Create an Account!',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
              ),
              // style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 7.0),
            const Text(
              'Create your profile to start your journey',
              style: TextStyle(fontSize: 15.0),
            ),
            const SizedBox(height: 40.0),
            TextField(
              controller: namesController,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    namesErrorText = 'Full names are required';
                  });
                } else {
                  setState(() {
                    namesErrorText = null;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Full Names',
                hintText: 'Enter Full name',
                errorText: namesErrorText,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    phoneErrorText = 'Phone number is required';
                  });
                } else {
                  setState(() {
                    phoneErrorText = null;
                  });
                }
              },
              decoration: InputDecoration(
                  labelText: 'Phone Numbers',
                  hintText: 'Enter phone Number',
                  errorText: phoneErrorText),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: locationController,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    phoneErrorText = 'Location is required';
                  });
                } else {
                  setState(() {
                    phoneErrorText = null;
                  });
                }
              },
              decoration: InputDecoration(
                  labelText: 'Location',
                  hintText: 'Enter your location',
                  errorText: locationErrorText),
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
              controller: passwordController,
              obscureText: _obscureText,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    passwordErrorText = 'Password is required';
                  });
                } else if (value.length < 8) {
                  setState(() {
                    passwordErrorText =
                        'Password should be at least 8 characters long';
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
            const SizedBox(height: 24.0),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(310, 40),
                ),
              ),
              onPressed:
                  isLoading ? null : _register, // Disable button during loading
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
                  : const Text(
                      'Register',
                      style: TextStyle(fontSize: 16.0),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account ?',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(width: 5),
                TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.pink, fontSize: 18.0),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
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
