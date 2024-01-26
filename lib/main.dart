import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raio/core/app_apiclient.dart';
import 'package:raio/data/datasource/movie_remote_datasource.dart';

void main() {
  AppApiClient apiClient = AppApiClient(http.Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  dataSource.getMovieTrending();
  dataSource.getMoviePopularTrending();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
