import 'package:flutter/material.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Payments Method',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.pink),
            ),
          ),
          Expanded(
            // Wrap the ListView in an Expanded widget
            child: ListView(
              children: [
                _buildListTile(
                  icon: Icons.wallet,
                  title: "Ecocash",
                  onTap: () {
                    // Handle the About item click here
                    // You can navigate to a new page or perform an action
                  },
                ),
                _buildListTile(
                  icon: Icons.wallet,
                  title: "Mpesa",
                  onTap: () {
                    // Handle the Contact Us item click here
                    // You can navigate to a new page or perform an action
                    Navigator.pushNamed(context, '/contact');
                  },
                ),
                _buildListTile(
                  icon: Icons.wallet,
                  title: "FNB",
                  onTap: () {
                    // Handle the Payments item click here
                    // You can navigate to a new page or perform an action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build a ListTile with GestureDetector
  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: Colors.pink,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 19),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
