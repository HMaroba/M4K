import 'package:flutter/material.dart';
import 'package:m4k/screens/customerDashboard/customer_dashboard.dart';
import 'package:m4k/screens/customerDashboard/user_bookings.dart';

class CustomerBookings extends StatefulWidget {
  const CustomerBookings({super.key});

  @override
  State<CustomerBookings> createState() => _CustomerBookingsState();
}

class _CustomerBookingsState extends State<CustomerBookings> {
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
        body: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap:
                true, // Ensure the ListView doesn't take more space than needed
            itemCount: bookingList.length,
            itemBuilder: (BuildContext context, int index) {
              final item = bookingList[index];
              return Card(
                elevation: 2, // Add elevation for a card-like appearance
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(
                    item['name'],
                    style: const TextStyle(fontSize: 19),
                  ),

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Price: ${item['price']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Pickup DateTime: ${item['pickupdateTime']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Status : ${item['status']}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.pink),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Edit',
                                style: TextStyle(fontSize: 17),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Delete',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 17),
                              )),
                        ],
                      )
                    ],
                  ),
                  // trailing: IconButton(
                  //     onPressed: () {}, icon: const Icon(Icons.edit)),
                ),
              );
            },
          ),
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
