import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'M4K LAUNDRY SERVICES',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.pink,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/logo.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text(
              'Welcome',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text(
              'Customer Bookings',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => {Navigator.popAndPushNamed(context, '/allbookings')},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => {
              // Navigator.of(context).pop()
              Navigator.pushNamed(context, '/profile')
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => {
              // Navigator.of(context).pop()
              Navigator.pushNamed(context, '/about')
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => {_signOut()},
          ),
        ],
      ),
    );
  }
}
