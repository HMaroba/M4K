import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:m4k/screens/customerDashboard/price_list.dart';
import 'package:m4k/screens/customerDashboard/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  String? userId;
  String userfullname = 'John Doe';

  // Using Email to fetch Data
  Future<void> fetchUserData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('customers')
          .where('userId', isEqualTo: _user!.uid)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Assuming that email is a unique field, you can access the first document
        DocumentSnapshot userDoc = snapshot.docs.first;
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

        setState(() {
          userfullname = userData['names'] ?? 'John Doe';
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    // Fetch user data from Firestore
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Container (Not scrollable)
            Container(
              width: double.infinity,
              height: 130,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.pink,
                    Color(0xFFC30F31),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 46.0, left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      userfullname,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            // The rest of the content (scrollable)
            Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/services.png',
                    height: 190,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Our Services',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 176.0,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        // Handle indicator change if needed
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: servicesList.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final item = servicesList[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item['imagePath'],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       left: 8, top: 16, bottom: 5),
                            //   child: Text(
                            //     item['name'],
                            //     style: const TextStyle(
                            //         fontSize: 23, fontWeight: FontWeight.w400),
                            //   ),
                            // )
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Our Prices',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 270.0,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        // Handle indicator change if needed
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: priceList.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final item = priceList[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item['imagePath'],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 8, bottom: 5),
                              child: Text(
                                item['name'],
                                style: const TextStyle(fontSize: 22),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
