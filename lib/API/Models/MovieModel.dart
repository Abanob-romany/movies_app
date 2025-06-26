class Movie {
  final String title;
  final String year;
  final String rating;
  final String runtime;
  final String summary;
  final String coverImage;
  final List<String> screenshots;

  Movie({
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.summary,
    required this.coverImage,
    required this.screenshots,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      year: json['year']?.toString() ?? '',
      rating: json['rating']?.toString() ?? '',
      runtime: json['runtime']?.toString() ?? '',
      summary: json['summary'] ?? '',
      coverImage: json['large_cover_image'] ?? '',
      screenshots: [
        json['large_screenshot_image1'],
        json['large_screenshot_image2'],
        json['large_screenshot_image3'],
      ].whereType<String>().toList(),
    );
  }

}
