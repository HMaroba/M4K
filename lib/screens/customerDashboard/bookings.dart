import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'customer_dashboard.dart';
import 'edit_booking.dart';

class CustomerBookings extends StatefulWidget {
  const CustomerBookings({super.key});

  @override
  State<CustomerBookings> createState() => _CustomerBookingsState();
}

class _CustomerBookingsState extends State<CustomerBookings> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  // Function to delete a booking document from Firestore
  Future<void> deleteBooking(String bookingId) async {
    try {
      await _firestore.collection('bookings').doc(bookingId).delete();
      print('Booking deleted successfully');
    } catch (e) {
      print('Error deleting booking: $e');
    }
  }

  // Show an alert dialog to confirm deletion
  Future<void> _showDeleteConfirmationDialog(String bookingId) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this booking?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the deleteBooking function when the "Delete" button is pressed
                deleteBooking(bookingId);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<String?> getLaundryStatus(String bookingId) async {
    try {
      DocumentSnapshot bookingSnapshot = await FirebaseFirestore.instance
          .collection('bookings')
          .doc(bookingId)
          .get();

      if (bookingSnapshot.exists) {
        Map<String, dynamic> bookingData =
            bookingSnapshot.data() as Map<String, dynamic>;

        return bookingData['LaundryStatus'];
      }
    } catch (e) {
      print('Error fetching laundry status: $e');
    }
    return null; // Return null if there was an error or the document doesn't exist
  }

  Future<void> _showLaundryStatus(String bookingId) async {
    String? laundryStatus = await getLaundryStatus(bookingId);

    if (laundryStatus != null) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Laundry Status',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Status: $laundryStatus',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Handle the case where the status couldn't be retrieved
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Laundry Status'),
            content: const Text('Unable to fetch laundry status.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
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
          title: const Text("My Bookings"),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('bookings')
              .where('userId', isEqualTo: _user?.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator()); // Handle loading state
            } else if (snapshot.hasError) {
              return Center(
                  child:
                      Text('Error: ${snapshot.error}')); // Handle error state
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text(
                      'No bookings found for this user.')); // Handle no data
            } else {
              final List<DocumentSnapshot> bookingDocs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: bookingDocs.length,
                itemBuilder: (BuildContext context, int index) {
                  final DocumentSnapshot booking = bookingDocs[index];
                  final Map<String, dynamic> bookingData =
                      booking.data() as Map<String, dynamic>; // Convert to Map
                  final bookingId = booking.id; // Get the document ID

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
                            'Pickup DateTime: ${bookingData['date']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Pickup Time: ${bookingData['time']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Pickup Point: ${bookingData['location']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Status: ${bookingData['bookingStatus']}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.pink),
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
                                      builder: (context) => EditBooking(
                                        docId: booking.id,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Edit',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _showLaundryStatus(bookingId);
                                },
                                child: const Text(
                                  'View Status',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _showDeleteConfirmationDialog(bookingId);
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 17),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/book');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class LaundryStatusModal extends StatelessWidget {
  final String bookingId; // Pass the booking ID to retrieve laundry status

  LaundryStatusModal(this.bookingId);

  @override
  Widget build(BuildContext context) {
    // Implement your code to retrieve and display laundry status here
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Add UI elements to display the laundry status here
              Text(
                'Laundry Status for Booking #$bookingId',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // Add more widgets to display status details here
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the modal
                },
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
