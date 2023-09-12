import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text("Facebook"),
          ),
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text("Facebook"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text("Call"),
          )
        ],
      ),
    );
  }
}
