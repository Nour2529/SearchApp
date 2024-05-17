import 'package:flutter/material.dart';

import '../Menu/drawer.widget.dart';

class ParametresPage extends StatelessWidget {
  const ParametresPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white, // App bar text color
            fontSize: 24, // App bar text size
          ),
        ),
        backgroundColor: Color(0xFF3b5998),
        elevation: 0, // Removing shadow
        iconTheme: IconThemeData(color: Colors.white), // App bar icon color
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.blue),
            title: Text('Account'),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.blue),
            title: Text('Notifications'),
          ),
          ListTile(
            leading: Icon(Icons.security, color: Colors.blue),
            title: Text('Privacy'),
          ),
        ],
      ),
    );
  }
}
