import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; //Ajout de l'import pour utiliser DateFormat

class MeteoDetailsPage extends StatefulWidget {
  final String ville;

  MeteoDetailsPage({required this.ville});

  @override
  State<MeteoDetailsPage> createState() => _MeteoDetailsPageState();
}

class _MeteoDetailsPageState extends State<MeteoDetailsPage> {
  var meteoData;

  @override
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  void getMeteoData(String ville) {
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=${ville}&appid=84710cf05af1ded188bf609c2c3765e6";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.meteoData = json.decode(resp.body);
        print(this.meteoData);
      });
    }).catchError((err) {
      print("Error: $err");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Meteo Page ${widget.ville}"),
      ),
      body: meteoData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: meteoData['list'].length,
        itemBuilder: (context, index) {
          var item = meteoData['list'][index];
          return Card(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "images/${meteoData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png",
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${(meteoData['list'][index]['main']['temp'] - 273.15).toStringAsFixed(2)} °C",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          // Ajoutez ici d'autres widgets pour afficher d'autres détails météo si nécessaire
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
