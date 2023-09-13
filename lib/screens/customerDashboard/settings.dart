import 'package:flutter/material.dart';

import 'customer_dashboard.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
          title: const Text("Settings"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView(
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
                  trailing: Icon(Icons.arrow_forward),
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
                  trailing: Icon(Icons.arrow_forward),
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
                  trailing: Icon(Icons.arrow_forward),
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
                  trailing: Icon(Icons.arrow_forward),
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
                  trailing: Icon(Icons.arrow_forward),
                )
              ],
            ),
            const SizedBox(
              height: 34,
            ),
            const Text(
              'Feedback',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 27),
            )
          ],
        ),
      ),
    );
  }
}
