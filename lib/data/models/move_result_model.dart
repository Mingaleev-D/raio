import 'package:raio/domain/entity/movie_entity.dart';

class MovieResulModel {
  // int? page;
  List<MovieResults>? results;

  // int? totalPages;
  // int? totalResults;

  MovieResulModel({
    //this.page,
    this.results,
    // this.totalPages,
    // this.totalResults,
  });

  MovieResulModel.fromJson(Map<String, dynamic> json) {
    // page = json['page'];
    if (json['results'] != null) {
      results = <MovieResults>[];
      json['results'].forEach((v) {
        results!.add(new MovieResults.fromJson(v));
      });
    }
    // totalPages = json['total_pages'];
    // totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    // data['total_pages'] = this.totalPages;
    // data['total_results'] = this.totalResults;
    return data;
  }
}

class MovieResults extends MovieEntity {
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieResults(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.title,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.mediaType,
      required this.genreIds,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteAverage,
      required this.voteCount})
      : super(
            backdropPath: backdropPath,
            id: id,
            title: title,
            overview: overview,
            posterPath: posterPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage);

  factory MovieResults.fromJson(Map<String, dynamic> json) {
    return MovieResults(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'] ?? '',
      genreIds: json['genre_ids'].cast<int>(),
      popularity: json['popularity'],
      releaseDate: json['release_date'],
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['title'] = this.title;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['media_type'] = this.mediaType;
    data['genre_ids'] = this.genreIds;
    data['popularity'] = this.popularity;
    data['release_date'] = this.releaseDate;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
