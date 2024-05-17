import 'package:flutter/material.dart';
import 'package:miniprojet/pages/pays-details.page.dart';

import '../Menu/drawer.widget.dart';

class PaysPage extends StatelessWidget {
  TextEditingController txt_pays = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pays"),
      ),
      drawer: MyDrawer(), // Ajout du menu drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Recherche une pays",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            TextFormField(
              controller: txt_pays,
              decoration: InputDecoration(
                labelText: "Entrez un mot-clé",
                prefixIcon: Icon(Icons.location_city, color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _onGetGalleryDetails(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
              ),
              child: Text(
                "Chercher",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
              ),
              child: Text(
                "Retour",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onGetGalleryDetails(BuildContext context) {
    String keyword = txt_pays.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaysDetailsPage(keyword: txt_pays.text)),
    );
  }
}

