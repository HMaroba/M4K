import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m4k/screens/adminDashboard/admin_dashboard.dart';
import 'package:m4k/screens/adminDashboard/admin_editBooking.dart';

class CustomersBookingScreen extends StatefulWidget {
  const CustomersBookingScreen({super.key});

  @override
  State<CustomersBookingScreen> createState() => _CustomersBookingScreenState();
}

class _CustomersBookingScreenState extends State<CustomersBookingScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text("Bookings List"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('bookings').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Handle loading state
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Handle error state
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text('No bookings found')); // Handle no data
          } else {
            final List<DocumentSnapshot> bookingDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: bookingDocs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot booking = bookingDocs[index];
                final Map<String, dynamic> bookingData =
                    booking.data() as Map<String, dynamic>; // Convert to Map
                //final bookingId = booking.id; // Get the document ID

                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    // title: Text(
                    //   bookingData['name'] ?? '',
                    //   style: const TextStyle(fontSize: 19),
                    // ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        // Text(
                        //   'Price: ${bookingData['price']}',
                        //   style: const TextStyle(fontSize: 16),
                        // ),
                        Text(
                          'Pickup Date: ${bookingData['date']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Pickup Time: ${bookingData['time']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Delivery Time: ${bookingData['deliveryTime']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Delivery Date: ${bookingData['deliveryDate']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Pickup Address: ${bookingData['location']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Phone Number: ${bookingData['phone']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Status: ${bookingData['bookingStatus']}',
                          style:
                              const TextStyle(fontSize: 18, color: Colors.pink),
                        ),
                        Text(
                          'Laundry Status: ${bookingData['LaundryStatus']}',
                          style:
                              const TextStyle(fontSize: 18, color: Colors.pink),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminEditBooking(
                                      docId: booking.id,
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Edit Booking',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
