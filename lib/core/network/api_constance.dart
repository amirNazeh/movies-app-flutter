class ApiConstance{
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '4477a975e3f21a0e9846875761c80e5b';

  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String PopularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String TopRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String MoviesDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendatinPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static const String baseImageUrl='https://image.tmdb.org/t/p/w500/';

  static String imageUrl(String path) => '$baseImageUrl$path';
}