
import 'package:movie_player/movies/data/models/movie_details_model.dart';
import 'package:movie_player/movies/data/models/movie_model.dart';
import 'package:dio/dio.dart';
import 'package:movie_player/movies/data/models/recommendation_model.dart';
import 'package:movie_player/movies/domain/usecasses/get_movie_details_usecase.dart';
import 'package:movie_player/movies/domain/usecasses/get_recommendation_usecase.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_massege_model.dart';

abstract class BaesMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParmeters parameters );
}
class MovieRemoteDataSource extends BaesMovieRemoteDataSource{

  @override
  Future<List<MovieModel>> getNowPlayingMovies()async{
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode==200){
      return List<MovieModel>.from((response.data['results']as List).map(
              (e) => MovieModel.fromJson(e)
      ));
    } else{
     throw ServerException(
         errorMassegeModel: ErrorMassegeModel.fromJson(response.data)

     );
    }

  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await Dio().get(ApiConstance.PopularMoviesPath);

    if (response.statusCode==200){
      return List<MovieModel>.from((response.data['results']as List).map(
              (e) => MovieModel.fromJson(e)
      ));
    } else{
      throw ServerException(
          errorMassegeModel: ErrorMassegeModel.fromJson(response.data)

      );
    }

  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(ApiConstance.TopRatedMoviesPath);

    if (response.statusCode==200){
      return List<MovieModel>.from((response.data['results']as List).map(
              (e) => MovieModel.fromJson(e)
      ));
    } else{
      throw ServerException(
          errorMassegeModel: ErrorMassegeModel.fromJson(response.data)

      );
    }

  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(
      MovieDetailsParameters parameters) async{
    final response = await Dio().get(ApiConstance.MoviesDetailsPath(parameters.movieId));

    if (response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);
    } else{
      throw ServerException(
          errorMassegeModel: ErrorMassegeModel.fromJson(response.data)

      );
    }

  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParmeters parameters) async{
    final response = await Dio().get(ApiConstance.recommendatinPath(parameters.id));

    if (response.statusCode==200){
      return List<RecommendationModel>.from((response.data['results']as List).map(
              (e) => RecommendationModel.fromJson(e)
      ));
    } else{
      throw ServerException(
          errorMassegeModel: ErrorMassegeModel.fromJson(response.data)

      );
    }

  }

}