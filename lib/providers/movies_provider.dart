import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movies/models/models.dart';


class MoviesProvider extends ChangeNotifier {
  
  String _apiKey   = '547b07458cf820dfa1ffb5d826b0bded';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage     = 0;
  bool _loadingPopular = false;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularesMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'api_key' : _apiKey,
      'language': _language,
      'page'    : '$page'
    });
    
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularesMovies() async {
    if(_loadingPopular) return;
    
    _loadingPopular = true;
    _popularPage++;
    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
    _loadingPopular = false;
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}