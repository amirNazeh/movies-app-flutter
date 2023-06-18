
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_player/core/utils/enums.dart';
import 'package:movie_player/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_player/movies/data/repository/movies_repository.dart';
import 'package:movie_player/movies/domain/repository/base_movies_rebository.dart';
import 'package:movie_player/movies/domain/usecasses/get_TopRated_playing_usecasses.dart';
import 'package:movie_player/movies/domain/usecasses/get_now_playing_usecasses.dart';
import 'package:movie_player/movies/domain/usecasses/get_popular_playing_usecasses.dart';
import '../../../core/usecasse/base_usecass.dart';
import 'movies_event.dart';
import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(
      this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase
      ): super( MoviesState()) {
    on<GetNowPlayingMoviesEvent>(getNowPlayingMovis);

    on<GetPopularMoviesEvent>(getPopularMovies);

    on<GetTopRatedMoviesEvent>(getTopRatedMovies);

  }




  FutureOr<void> getNowPlayingMovis(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
      final result= await getNowPlayingMoviesUseCase(const NoParameter());
      emit(MoviesState(nowPlayingState: RequestState.loading));
      result.fold(
              (l) => emit(
              state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message,
              )
          ),
              (r) => emit(
              state.copyWith(
                  nowPlayingMovies: r,
                  nowPlayingState: RequestState.loaded
              )
          )
      );
    }

  FutureOr<void> getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold(
            (l) => emit(
            state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )
        ),
            (r) => emit(
            state.copyWith(
                popularMovies: r,
                popularState: RequestState.loaded
            )
        )
    );
  }

  FutureOr<void> getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
      final  result= await getTopRatedMoviesUseCase(const NoParameter());
      result. fold(
              (l) => emit(
                state.copyWith(
                  topRatedState: RequestState.error,
                    topRatedMessage: l.message
                )
              ),
              (r) => emit(
                state.copyWith(
                  topRatedMovies: r,
                  topRatedState: RequestState.loaded

                )
              )
      );
  }
}
