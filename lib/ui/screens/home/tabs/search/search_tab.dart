import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchtabState();
}

class _SearchtabState extends State<SearchTab> {
  final TextEditingController searchController = TextEditingController();
  final List<String> fakeMovies = [
    'Inception',
    'The Dark Knight',
    'Interstellar',
    'Tenet',
    'The Prestige',
    'Oppenheimer',
    'Dunkirk',
  ];

  List<String> searchResults = [];

  void onSearch(String query) {
    final results = fakeMovies
        .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      searchResults = results;
    });
  }

  @override
  void initState() {
    super.initState();
    searchResults = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: onSearch,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for movies...',
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

          // 🔍 Results or Image
          Expanded(
            child: searchResults.isEmpty && searchController.text.isNotEmpty
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
                return ListTile(
                  title: Text(
                    searchResults[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
