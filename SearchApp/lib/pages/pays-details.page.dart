import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaysDetailsPage extends StatefulWidget {
  final String keyword;

  PaysDetailsPage({required this.keyword});

  @override
  State<PaysDetailsPage> createState() => _PaysDetailsPageState();
}

class _PaysDetailsPageState extends State<PaysDetailsPage> {
  Map<String, dynamic>? paysData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getPaysData(widget.keyword);
  }

  Future<void> getPaysData(String keyword) async {
    String url = "https://restcountries.com/v2/name/${keyword}";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          var responseBody = utf8.decode(response.bodyBytes); // Decode Unicode characters//traduction
          paysData = json.decode(responseBody)[0];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load country data');
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }


  String getCityNameInNativeLanguage(String? cityName, String? countryCode) {
    if (cityName == null || countryCode == null) {
      return "Unknown";
    }
    Map<String, String> languageMap = {
      'IT': 'it', // Example: Italy - Italian

    };
    if (languageMap.containsKey(countryCode)) {
      return cityName; // Replace this with the actual translation logic
    } else {
      return cityName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Détails du pays ${widget.keyword}",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : paysData == null
          ? Center(
        child: Text("Failed to load country data"),
      )
          : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                paysData!['flags']['png'],
                width: 150,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            _buildNormalSection(getCityNameInNativeLanguage(paysData!['name'], paysData!['alpha2Code'])),
            _buildNormalSection(getCityNameInNativeLanguage(paysData!['translations']['fa'], paysData!['alpha2Code'])),
            _buildBlueSection("Administration"),
            _buildSection("Capitale:", getCityNameInNativeLanguage(paysData!['capital'], paysData!['alpha2Code'])),
            _buildSection("Langue:", paysData!['languages'][0]['name']),
            _buildBlueSection("Géographie"),
            _buildSection("Région:", paysData!['region']),
            _buildSection("Superficie:", "${paysData!['area']} km²"),
            _buildSection("Fuseau horaire:", paysData!['timezones'][0]),
            _buildBlueSection("Démographie"),
            _buildSection("Population:", "${paysData!['population']}"),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildBlueSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildNormalSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
