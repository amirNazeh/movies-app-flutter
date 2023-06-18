import 'package:dartz/dartz.dart';
import 'package:movie_player/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_player/movies/domain/entities/movie.dart';
import 'package:movie_player/movies/domain/entities/movie_detail.dart';
import 'package:movie_player/movies/domain/entities/recommendation.dart';
import 'package:movie_player/movies/domain/usecasses/get_movie_details_usecase.dart';
import 'package:movie_player/movies/domain/usecasses/get_recommendation_usecase.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository{


  Future<Either<Failure , List<Movie>>> getNowPlaying();

  Future<Either<Failure , List<Movie>>> getPopularMovies();

  Future<Either<Failure , List<Movie>>> getTopRatedMovies();

  Future<Either<Failure , MovieDetail>> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either<Failure , List<Recommendation>>> getRecommendation(
      RecommendationParmeters parmeters
      );
}