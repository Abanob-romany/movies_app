import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/screens/movie%20details/movie_details.dart';
import '../../../../API/Models/MovieModel.dart';

<<<<<<< Updated upstream:lib/ui/screens/home/tabs/profile/profile_tab.dart
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
=======
class Browetap extends StatefulWidget {
  const Browetap({super.key});
>>>>>>> Stashed changes:lib/ui/screens/home/tabs/BroweTap.dart

  @override
  State<Browetap> createState() => _BrowetapState();
}

class _BrowetapState extends State<Browetap> {
  final List<String> categories = ['Action', 'Adventure', 'Animation'];
  String selectedGenre = 'Action';
  List<dynamic> movies = [];
  bool isLoading = false;

  Future<void> fetchMoviesByGenre(String genre) async {
    setState(() {
      isLoading = true;
      selectedGenre = genre;
    });

    final url = Uri.parse("https://yts.mx/api/v2/list_movies.json?genre=$genre");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          movies = data['data']['movies'] ?? [];
        });
      } else {
        setState(() {
          movies = [];
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        movies = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMoviesByGenre(selectedGenre);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category == selectedGenre;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ChoiceChip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  label: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? AppColors.black : AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  side: BorderSide(color: AppColors.primaryColor),
                  selected: isSelected,
                  selectedColor: AppColors.primaryColor,
                  backgroundColor: AppColors.black,
                  onSelected: (_) => fetchMoviesByGenre(category),
                  showCheckmark: false,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: isLoading
              ? const Center(child: CircularProgressIndicator(color: Colors.white))
              : GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () async {
                  final movieId = movie['id'];
                  final url = Uri.parse("https://yts.mx/api/v2/movie_details.json?movie_id=$movieId&with_images=true");

                  try {
                    final response = await http.get(url);
                    if (response.statusCode == 200) {
                      final jsonData = json.decode(response.body);
                      final fullMovieData = jsonData['data']['movie'];
                      final movieObj = Movie.fromJson(fullMovieData);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetails(movie: movieObj),
                        ),
                      );
                    }
                  } catch (e) {
                    print('Error fetching full details: $e');
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          movie['medium_cover_image'],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      movie['title'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${movie['year']}",
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
