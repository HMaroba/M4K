import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? emailErrorText;
  String? timeErrorText;
  String? phoneErrorText;
  String? dateErrorText;
  String? locationErrorText;
  bool isLoading = false;

  Future<void> _register() async {
    String email = emailController.text;
    String time = timeController.text;
    String date = dateController.text;
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

    // Validate date field
    if (date.isEmpty) {
      setState(() {
        dateErrorText = 'Pickup date is required';
      });
    } else {
      setState(() {
        dateErrorText = null;
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
    if (time.isEmpty) {
      setState(() {
        timeErrorText = 'Time is required';
      });
    } else {
      setState(() {
        timeErrorText = null;
      });
    }

    // Proceed with registration if both fields are valid
    if (emailErrorText == null &&
        timeErrorText == null &&
        phoneErrorText == null &&
        locationErrorText == null &&
        dateErrorText == null) {
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
        dateController.clear();
        timeController.clear();
        phoneController.clear();
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
        // Navigator.pushNamed(context, '/loginpage');
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
      appBar: AppBar(
        title: const Text("Book Now"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0),
            const Text(
              'Book Now!',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
              // style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 7.0),
            const Text(
              'We will respond to you shortly',
              style: TextStyle(fontSize: 15.0),
            ),
            const SizedBox(height: 50.0),
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
              controller: dateController,
              keyboardType: TextInputType.datetime,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    dateErrorText = 'Pick up date is required';
                  });
                } else {
                  setState(() {
                    dateErrorText = null;
                  });
                }
              },
              decoration: InputDecoration(
                  labelText: 'Pickup date',
                  hintText: 'Enter your pick up date',
                  errorText: dateErrorText),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: timeController,
              keyboardType: TextInputType.datetime,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    timeErrorText = 'Time is required';
                  });
                } else {
                  setState(() {
                    timeErrorText = null;
                  });
                }
              },
              decoration: InputDecoration(
                  labelText: 'Pick up time',
                  hintText: 'Enter pick up time',
                  errorText: timeErrorText),
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
                      'Submit',
                      style: TextStyle(fontSize: 16.0),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
