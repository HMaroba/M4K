import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditBooking extends StatefulWidget {
  final String docId;

  const EditBooking({
    super.key,
    required this.docId,
  });

  @override
  State<EditBooking> createState() => _EditBookingState();
}

class _EditBookingState extends State<EditBooking> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  String? userId;

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
  String? bookingStatus;
  String? laundryStatus;

  Map<String, dynamic>? propertyData;

  void fetchPropertyData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('bookings')
          .doc(widget.docId) // Use the provided docId
          .get();
      setState(() {
        propertyData = snapshot.data() as Map<String, dynamic>;

        emailController.text = propertyData?['email'] ?? '';
        timeController.text = propertyData?['time'] ?? '';
        dateController.text = propertyData?['date'] ?? '';
        phoneController.text = propertyData?['phone'] ?? '';
        locationController.text = propertyData?['location'] ?? '';
      });
    } catch (e) {
      print('Error fetching property data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      userId = _user!.uid;
      // Fetch user data from Firestore
      fetchPropertyData();
    } else if (_user == null) {
      Navigator.pushNamed(context, '/login');
    }
  }

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

        // Get the newly created user's ID
        String userId = _user!.uid;
        print(userId);
        //Create a map of the data you want to send

        //Send the data to Firestore
        await FirebaseFirestore.instance
            .collection('bookings')
            .doc(widget.docId)
            .update({
          'email': email,
          'date': date,
          'time': time,
          'phone': "+266$phone",
          'location': location,
          'userId': userId,
        });

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

        Fluttertoast.showToast(
          msg: "Booking updated Sucessfully",
          toastLength: Toast
              .LENGTH_SHORT, // Duration for which the toast will be visible
          gravity: ToastGravity
              .CENTER, // Position of the toast message on the screen
          backgroundColor:
              Colors.black54, // Background color of the toast message
          textColor: Colors.green, // Text color of the toast message
        );
        // Navigate back
        Navigator.pop(context);
      } catch (e) {
        // Handle any errors that occur during the data submission

        setState(() {
          isLoading = false; // Stop loading
        });

        print('Error submitting data: $e');
        Fluttertoast.showToast(
          msg: "Something went wrong please try again",
          toastLength: Toast
              .LENGTH_SHORT, // Duration for which the toast will be visible
          gravity: ToastGravity
              .CENTER, // Position of the toast message on the screen
          backgroundColor:
              Colors.black54, // Background color of the toast message
          textColor: Colors.red, // Text color of the toast message
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Booking"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
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
                onPressed: isLoading
                    ? null
                    : _register, // Disable button during loading
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
                        'Update Booking',
                        style: TextStyle(fontSize: 16.0),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
