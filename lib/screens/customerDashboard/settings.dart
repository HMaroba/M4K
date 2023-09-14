import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth/login.dart';
import 'customer_dashboard.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Settings',
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
                    icon: Icons.info,
                    title: "About",
                    onTap: () {
                      // Handle the About item click here
                      // You can navigate to a new page or perform an action
                    },
                  ),
                  _buildListTile(
                    icon: Icons.email,
                    title: "Contact Us",
                    onTap: () {
                      // Handle the Contact Us item click here
                      // You can navigate to a new page or perform an action
                      Navigator.pushNamed(context, '/contact');
                    },
                  ),
                  _buildListTile(
                    icon: Icons.wallet,
                    title: "Payments",
                    onTap: () {
                      // Handle the Payments item click here
                      // You can navigate to a new page or perform an action
                      Navigator.pushNamed(context, '/payments');
                    },
                  ),
                  _buildListTile(
                    icon: Icons.wallet_giftcard_outlined,
                    title: "My Rewards",
                    onTap: () {
                      // Handle the My Rewards item click here
                      // You can navigate to a new page or perform an action
                    },
                  ),
                  _buildListTile(
                    icon: Icons.feedback,
                    title: "Send Feedback",
                    onTap: () {
                      // Navigate to login
                      Navigator.pushNamed(context, '/feedback');
                    },
                  ),
                  _buildListTile(
                    icon: Icons.logout,
                    title: "Logout",
                    onTap: () {
                      _signOut();
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
