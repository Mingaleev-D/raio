import '../../core/app_apiclient.dart';
import '../models/move_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieResults>> getMovieTrending();
  Future<List<MovieResults>> getMoviePopularTrending();
  Future<List<MovieResults>> getMoviePlayingNow();
  Future<List<MovieResults>> getMovieComingSoon();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final AppApiClient _client;
  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieResults>> getMovieTrending() async {
    final response = await _client.get('trending/movie/day');
    final movie = MovieResulModel.fromJson(response).results!;
    print(movie);
    return movie;
  }

  @override
  Future<List<MovieResults>> getMoviePopularTrending() async {
    final response = await _client.get('movie/popular');
    final movie = MovieResulModel.fromJson(response).results!;
    print(movie);
    return movie;
  }

  @override
  Future<List<MovieResults>> getMovieComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movie = MovieResulModel.fromJson(response).results!;
    print(movie);
    return movie;
  }

  @override
  Future<List<MovieResults>> getMoviePlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movie = MovieResulModel.fromJson(response).results!;
    print(movie);
    return movie;
  }
}
