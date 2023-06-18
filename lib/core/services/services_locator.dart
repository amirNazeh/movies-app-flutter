import 'package:get_it/get_it.dart';
import 'package:movie_player/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_player/movies/data/repository/movies_repository.dart';
import 'package:movie_player/movies/domain/repository/base_movies_rebository.dart';
import 'package:movie_player/movies/domain/usecasses/get_TopRated_playing_usecasses.dart';
import 'package:movie_player/movies/domain/usecasses/get_now_playing_usecasses.dart';
import 'package:movie_player/movies/domain/usecasses/get_popular_playing_usecasses.dart';
import 'package:movie_player/movies/domain/usecasses/get_recommendation_usecase.dart';
import 'package:movie_player/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movie_player/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/usecasses/get_movie_details_usecase.dart';

final sl = GetIt.instance;
class ServicesLocator{

  void init(){
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl() , sl()));

    ///Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
            () => MoviesRepository(sl()));

    /// DATA SOURCE
   sl.registerLazySingleton<BaesMovieRemoteDataSource> (
           ()=>MovieRemoteDataSource());
  }
}