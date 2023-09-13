import 'package:flutter/material.dart';

import 'customer_dashboard.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key});

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
        // appBar: AppBar(
        //   title: const Text("Settings"),
        // ),
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
                children: const [
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      size: 30,
                      color: Colors.pink,
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(fontSize: 19),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      size: 30,
                      color: Colors.pink,
                    ),
                    title: Text(
                      "Contact Us",
                      style: TextStyle(fontSize: 19),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.wallet,
                      size: 30,
                      color: Colors.pink,
                    ),
                    title: Text(
                      "Payments",
                      style: TextStyle(fontSize: 19),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.wallet_giftcard_outlined,
                      size: 30,
                      color: Colors.pink,
                    ),
                    title: Text(
                      "My Rewards",
                      style: TextStyle(fontSize: 19),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.feedback,
                      size: 30,
                      color: Colors.pink,
                    ),
                    title: Text(
                      "Feedback",
                      style: TextStyle(fontSize: 19),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.pink,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(fontSize: 19),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
