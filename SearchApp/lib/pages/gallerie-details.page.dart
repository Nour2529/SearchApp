
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryDetailsPage extends StatefulWidget {
  final String keyword;

  GalleryDetailsPage({required this.keyword});

  @override
  State<GalleryDetailsPage> createState() => _GalleryDetailsPageState();
}

class _GalleryDetailsPageState extends State<GalleryDetailsPage> {
  List<dynamic> hits = [];
  var galleryData;
  int currentPage = 1;
  int size = 10;
  late int totalPages;
  ScrollController _scrollController = ScrollController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getGalleryData(widget.keyword);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          currentPage++;
          getGalleryData(widget.keyword);
        }
      }
    });
  }

  void getGalleryData(String keyword) async {
    String url =
        "https://pixabay.com/api/?key=15646595-375eb91b3408e352760ee72c8&q=${keyword}&page=${currentPage}&per_page=${size}";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          galleryData = json.decode(response.body);
          hits.addAll(galleryData['hits']);
          totalPages = (galleryData['totalHits'] / size).ceil();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load gallery data');
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: totalPages == 0
            ? Text('Pas de résultats')
            : Text("${widget.keyword}, Page $currentPage/$totalPages"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hits.isEmpty
          ? Center(child: Text('Pas de résultats'))
          : ListView.builder(
        itemCount: hits.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  if (hits[index]['webformatURL'] != null)
                    Image.network(
                      hits[index]['webformatURL'],
                      fit: BoxFit.cover,
                    ),
                  SizedBox(height: 8),
                  Text(
                    hits[index]['tags'] ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}