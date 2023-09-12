import 'package:flutter/material.dart';

class CustomerBookings extends StatefulWidget {
  const CustomerBookings({super.key});

  @override
  State<CustomerBookings> createState() => _CustomerBookingsState();
}

class _CustomerBookingsState extends State<CustomerBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookings"),
        centerTitle: true,
      ),
      body: const Center(child: Text("Booking List")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/book');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
