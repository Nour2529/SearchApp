import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Menu/drawer.widget.dart';
import '../config/global.params.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white, // App bar text color
            fontSize: 24, // App bar text size
          ),
        ),
        backgroundColor: Color(0xFF3b5998),
        elevation: 0, // Removing shadow
        iconTheme: IconThemeData(color: Colors.white), // App bar icon color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            ...(GlobalParams.homes as List).map((item) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "${item['route']}");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue, // Customizing container color
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        '${item['image']}',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${item['title']}',
                        style: TextStyle(
                          fontSize: 18, // Adjusting font size
                          color: Colors.white, // Text color
                          fontWeight: FontWeight.bold, // Adding bold font weight
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Future<void> _deconnexion(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("connecte", false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/authentification', (Route<dynamic> route) => false);
  }
}
