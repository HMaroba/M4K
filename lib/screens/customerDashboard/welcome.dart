import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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

  List catName = [
    "Booking",
    "Pickup",
    "Washing",
    "Ironing",
    "Folding",
    "Delivery"
  ];

  List<Color> catColors = [];

  List<Icon> catIcons = [
    Icon(
      Icons.book_outlined,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.delivery_dining,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.wash,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.iron,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.iron,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.delivery_dining_sharp,
      color: Colors.white,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 10),
            decoration: const BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.dashboard,
                      size: 35,
                      color: Colors.white,
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        height: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                    bottom: 4,
                  ),
                  child: Text(
                    'Hi ' + userfullname,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 15, top: 10),
                  child: Text(
                    "Clean Clothes\nHealthy You!",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 5, bottom: 10),
                //   width: MediaQuery.of(context).size.width,
                //   height: 55,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //     color: Colors.white,

                //   ),
                // )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/services.png',
                  height: 190,
                ),
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  itemCount: catName.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1.1),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.pink, shape: BoxShape.circle),
                          child: Center(
                            child: catIcons[index],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          catName[index],
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // CarouselSlider.builder(
                //   options: CarouselOptions(
                //     height: 300.0,
                //     enableInfiniteScroll: true,
                //     viewportFraction: 0.9,
                //     autoPlay: true,
                //     enlargeCenterPage: true,
                //     autoPlayInterval: const Duration(seconds: 4),
                //     autoPlayAnimationDuration:
                //         const Duration(milliseconds: 800),
                //     autoPlayCurve: Curves.fastOutSlowIn,
                //     pauseAutoPlayOnTouch: true,
                //     aspectRatio: 2.0,
                //     onPageChanged: (index, reason) {
                //       // Handle indicator change if needed
                //     },
                //     scrollDirection: Axis.horizontal,
                //   ),
                //   itemCount: servicesList.length,
                //   itemBuilder:
                //       (BuildContext context, int index, int realIndex) {
                //     final item = servicesList[index];
                //     return Container(
                //       height: 150,
                //       margin: const EdgeInsets.symmetric(
                //           vertical: 8, horizontal: 16),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Image.asset(
                //             item['imagePath'],
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(
                //                 left: 8, top: 16, bottom: 5),
                //             child: Text(
                //               item['name'],
                //               style: const TextStyle(
                //                   fontSize: 20, fontWeight: FontWeight.w400),
                //             ),
                //           )
                //         ],
                //       ),
                //     );
                //   },
                // ),
                const SizedBox(
                  height: 10,
                ),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Prices',
                //       style: TextStyle(
                //           fontSize: 25, fontWeight: FontWeight.normal),
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 10,
                ),
                // GridView.builder(
                //   itemCount: priceList.length,
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     childAspectRatio:
                //         (MediaQuery.of(context).size.height - 50 - 25) /
                //             (4 * 240),
                //     mainAxisSpacing: 10,
                //     crossAxisSpacing: 10,
                //   ),
                //   itemBuilder: (context, index) {
                //     final item = priceList[index];
                //     return Column(
                //       children: [
                //         Container(
                //           padding: EdgeInsets.symmetric(
                //               vertical: 20, horizontal: 10),
                //           // height: 120,
                //           // width: 120,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: Colors.white,
                //           ),
                //           child: Column(
                //             children: [
                //               Padding(
                //                 padding: EdgeInsets.all(10),
                //                 child: Image.asset(
                //                   item['imagePath'],
                //                   width: 100,
                //                   height: 100,
                //                 ),
                //               ),
                //               const SizedBox(
                //                 height: 4,
                //               ),
                //               Text(
                //                 item['name'],
                //                 style: const TextStyle(fontSize: 12),
                //               )
                //             ],
                //           ),
                //         ),
                //       ],
                //     );
                //   },
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
