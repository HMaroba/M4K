import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:m4k/screens/auth/login.dart';
import 'package:m4k/screens/customerDashboard/customer_dashboard.dart';
import 'package:video_player/video_player.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile "),
      ),
      body: const Center(child: Text("Profile Page")),
    );
  }
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  String? userId;

  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController namesController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? emailErrorText;
  String? passwordErrorText;
  String? namesErrorText;
  String? phoneErrorText;
  String? countryErrorText;
  String? locationErrorText;
  bool isLoading = false;

  // Using Email to fetch Data
  Future<void> fetchUserData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('customers')
          .where('email', isEqualTo: _user!.email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Assuming that email is a unique field, you can access the first document
        DocumentSnapshot userDoc = snapshot.docs.first;
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        namesController.text = userData['names'] ?? '';
        emailController.text = userData['email'] ?? '';
        phoneController.text = userData['phone'] ?? '';
        locationController.text = userData['location'] ?? '';
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      userId = _user!.uid;
      // Fetch user data from Firestore
      fetchUserData();
    } else if (_user == null) {
      Navigator.pushNamed(context, '/login');
    }
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      // Navigate to login page or any other page you want after logout
      // Clear the navigation stack and replace it with the login page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Future<void> _register() async {
    String email = emailController.text;
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
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
        // Prevent the default back button behavior
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
          ],
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
                Image.asset(
                  'assets/images/user.png',
                  height: 140,
                ),
                const Text(
                  'John Doe',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 7.0),
                const Text(
                  '+266 6333 8813',
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
                          'Update',
                          style: TextStyle(fontSize: 16.0),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WatchDemo extends StatefulWidget {
  const WatchDemo({super.key});

  @override
  State<WatchDemo> createState() => _WatchDemoState();
}

class _WatchDemoState extends State<WatchDemo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/flutter-image-upload-2f000.appspot.com/o/y2mate.com%20-%20Wash%20and%20fold%20drop%20off%20process%20at%20The%20Laundry%20Room_480p.mp4?alt=media&token=b8111418-ce77-4032-9b37-e78a7b0e2e55',
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
        // Prevent the default back button behavior
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Our Solution Demo'),
        ),
        // Use a FutureBuilder to display a loading spinner while waiting for the
        // VideoPlayerController to finish initializing.
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Wrap the play or pause in a call to `setState`. This ensures the
            // correct icon is shown.
            setState(() {
              // If the video is playing, pause it.
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
          // Display the correct icon depending on the state of the player.
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
