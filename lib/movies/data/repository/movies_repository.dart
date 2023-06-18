import 'package:dartz/dartz.dart';
import 'package:movie_player/core/error/exception.dart';
import 'package:movie_player/core/error/failure.dart';
import 'package:movie_player/movies/domain/entities/movie.dart';
import 'package:movie_player/movies/domain/entities/movie_detail.dart';
import 'package:movie_player/movies/domain/entities/recommendation.dart';
import 'package:movie_player/movies/domain/repository/base_movies_rebository.dart';
import 'package:movie_player/movies/domain/usecasses/get_movie_details_usecase.dart';
import 'package:movie_player/movies/domain/usecasses/get_recommendation_usecase.dart';

import '../datasource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository{
  BaesMovieRemoteDataSource baesMovieRemoteDataSource;

  MoviesRepository(this.baesMovieRemoteDataSource);
  @override
  Future<Either<Failure , List<Movie>>> getNowPlaying() async {
    final result = await baesMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassegeModel.statusMessage));
    }

  }


  @override
  Future<Either<Failure , List<Movie>>>getPopularMovies()async {
    final result = await baesMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassegeModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure , List<Movie>>> getTopRatedMovies() async {
    final result = await baesMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassegeModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailsParameters parameters) async {
    final result = await baesMovieRemoteDataSource.getMoviesDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassegeModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParmeters parameters) async {
    final result = await baesMovieRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassegeModel.statusMessage));
    }

  }
}

