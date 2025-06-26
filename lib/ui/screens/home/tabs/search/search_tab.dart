import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/ui/utils/app_assets.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchtabState();
}

class _SearchtabState extends State<SearchTab> {
  final TextEditingController searchController = TextEditingController();
  List<dynamic> searchResults = [];
  bool isLoading = false;

  Future<void> searchMovies(String query) async {
    if (query.trim().isEmpty) return;

    setState(() {
      isLoading = true;
    });

    final url = Uri.parse("https://yts.mx/api/v2/list_movies.json?query_term=$query");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          searchResults = data['data']['movies'] ?? [];
        });
      } else {
        setState(() {
          searchResults = [];
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        searchResults = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔍 Search Bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            onChanged: (value) => searchMovies(value),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search YTS Movies...',
              hintStyle: const TextStyle(color: Colors.white70),
              prefixIcon: const Icon(Icons.search, color: Colors.white70),
              filled: true,
              fillColor: Colors.grey[900],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // 🔄 Loading or Results
        Expanded(
          child: isLoading
              ? const Center(
            child: CircularProgressIndicator(color: Colors.white),
          )
              : searchResults.isEmpty && searchController.text.isNotEmpty
              ? Center(
            child: Image.asset(
              AppAssets.popcorn,
              width: 200,
              height: 200,
            ),
          )
              : ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final movie = searchResults[index];
              return ListTile(
                leading: Image.network(
                  movie['medium_cover_image'],
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  movie['title'],
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Year: ${movie['year']}',
                  style: const TextStyle(color: Colors.white54),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
