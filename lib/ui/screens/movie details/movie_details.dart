import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/auth/shared/elevated_button_builder.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_styles.dart';

import '../../../API/Models/MovieModel.dart';

class MovieDetails extends StatefulWidget {
  static const String routeName = '/movie-details';
  final Movie movie;

  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late Movie movie;

  @override
  void initState() {
    super.initState();
    movie = widget.movie;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(movie.coverImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 32),
                                onPressed: () => Navigator.pop(context),
                              ),
                              IconButton(
                                icon: Icon(Icons.bookmark, color: Colors.white, size: 32),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                movie.title,
                                style: AppStyle.bold24Black.copyWith(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                movie.year,
                                style: AppStyle.bold20Black.copyWith(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    buildElevatedButton(
                      text: 'Watch',
                      onPressed: () {},
                      backgroundColor: AppColors.red,
                      style: AppStyle.bold20White,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ratingBuilder(icon: Icons.heart_broken_rounded, text: '15'),
                        ratingBuilder(icon: Icons.access_time_filled, text: movie.runtime),
                        ratingBuilder(icon: Icons.star_rounded, text: movie.rating),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('Summary', style: AppStyle.bold24White),
                    Text(movie.summary, style: AppStyle.bold20White),
                    SizedBox(height: 16),
                    Text('Screen shots', style: AppStyle.bold24White),
                    if (movie.screenshots.isNotEmpty)
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Image.network(movie.screenshots[index]),
                          );
                        },
                        itemCount: movie.screenshots.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container ratingBuilder({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 24),
          SizedBox(width: 8),
          Text(text, style: AppStyle.bold20White),
        ],
      ),
    );
  }
}
