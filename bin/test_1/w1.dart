import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';

Future<void> main(List<String> arguments) async {
  final file = File('./assets/data.json');
  final data = await file.readAsString();
  final resultJson = jsonDecode(data);
  final pageResult = PageResult.fromJson(resultJson);

  final jsonString = await File(
    '/home/nguyennguyen2/Dev/intern_flutter_22_summer/test_dart/lib/resources/data.json',
  ).readAsString();

  await File('./assets/new_data.json').writeAsString(
    jsonEncode(pageResult.toJson()),
  );

  final movies = pageResult.results;
  movies.sort(
    (m1, m2) => m2.voteCount.compareTo(m1.voteCount),
  );
  print(
    movies.map((e) => e.voteCount).toList().join(' '),
  );

  // print(Uint8List.fromList(jsonEncode(pageResult.
  // toJson()).codeUnits).length);

  // print(
  //   jsonDecode(
  //     jsonEncode(pageResult.toJson()),
  //   ),
  // );
}

class PageResult {
  PageResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PageResult.fromJson(Map<String, dynamic> json) => PageResult(
        page: json['page'] as int,
        results: (json['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList(),
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
      );

  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  Map<String, dynamic> toJson() => {
        'page': 1,
        'results': results.map((movie) => movie.toJson()).toList(),
        'total_pages': 1000,
        'total_results': 20000
      };
}

enum MediaType {
  movie,
  music,
  sport,
}

extension MediaTypeExt on MediaType {
  String get rawValue {
    switch (this) {
      case MediaType.movie:
        return 'movie';
      case MediaType.music:
        return 'music';
      case MediaType.sport:
        return 'sport';
    }
  }

  static MediaType? fromMedia(String? rawValue) {
    switch (rawValue) {
      case 'movie':
        return MediaType.movie;
      case 'sport':
        return MediaType.sport;
      case 'music':
        return MediaType.music;
      default:
        return null;
    }
  }
}

class Movie {
  Movie({
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.video,
    required this.voteAverage,
    required this.overview,
    required this.backdropPath,
    required this.adult,
    required this.genreIds,
    required this.popularity,
    required this.mediaType,
    required this.voteCount,
    required this.releaseDate,
    required this.title,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'] as int,
        originalLanguage: json['original_language'] as String,
        originalTitle: json['original_title'] as String,
        posterPath: json['poster_path'] as String,
        video: json['video'] as bool,
        voteAverage: json['vote_average'] as double,
        overview: json['overview'] as String,
        backdropPath: json['backdrop_path'] as String,
        adult: json['adult'] as bool,
        genreIds: (json['genre_ids'] as List).cast<int>(),
        popularity: json['popularity'] as double,
        mediaType: MediaTypeExt.fromMedia(json['media_type'] as String?),
        voteCount: json['vote_count'] as int,
        releaseDate: DateFormat(
          'yyyy-MM-dd',
        ).parse(json['release_date'] as String),
        title: json['title'] as String,
      );

  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String title;
  final String posterPath;
  final bool video;
  final double voteAverage;
  final String overview;
  final DateTime releaseDate;
  final int voteCount;
  final String backdropPath;
  final bool adult;
  final List<int> genreIds;
  final double popularity;
  final MediaType? mediaType;

  Map<String, dynamic> toJson() => {
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'poster_path': posterPath,
        'video': video,
        'vote_average': voteAverage,
        'overview': overview,
        'release_date': DateFormat('yyyy-MM-dd').format(releaseDate),
        'vote_count': voteCount,
        'id': id,
        'adult': adult,
        'backdrop_path': backdropPath,
        'title': title,
        'genre_ids': genreIds,
        'popularity': popularity,
        'media_type': mediaType?.rawValue,
      };
}
