import 'package:flutter/material.dart';
import '../Menu/drawer.widget.dart';
import '../config/meteo-details.page.dart';

class MeteoPage extends StatelessWidget {
  TextEditingController txt_ville = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Météo"),
      ),
      drawer: MyDrawer(), // Ajout du menu drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Recherche de la météo",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            TextFormField(
              controller: txt_ville,
              decoration: InputDecoration(
                labelText: "Entrez le nom de la ville",
                prefixIcon: Icon(Icons.place, color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _onGetMeteoDetails(context);
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
                txt_ville.clear(); // Effacer le texte dans le champ de texte
              },
              child: Text(
                "Effacer",
                style: TextStyle(color: Colors.blueAccent),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onGetMeteoDetails(BuildContext context) {
    String v = txt_ville.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeteoDetailsPage(ville: v)),
    );
    txt_ville.clear(); // Effacer le texte après la navigation
  }
}
