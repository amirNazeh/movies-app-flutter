import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_player/core/utils/enums.dart';
import 'package:movie_player/movies/domain/entities/movie_detail.dart';
import 'package:movie_player/movies/domain/entities/recommendation.dart';
import 'package:movie_player/movies/domain/usecasses/get_movie_details_usecase.dart';
import 'package:movie_player/movies/domain/usecasses/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(getMovieDetails);
    on<GetMovieRecommendationEvent>(getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;


  FutureOr<void> getMovieDetails(
  GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async{
   final result = await getMovieDetailsUseCase(MovieDetailsParameters(
     movieId:event.id,
   ));

   result.fold(
           (l) => emit(state.copyWith(
             movieDetailsState: RequestState.error,
             movieDetailsmessage: l.message
           )),
           (r) => emit(
             state.copyWith(
               movieDetail: r,
               movieDetailsState: RequestState.loaded
             ) ,

           ));
  }



  FutureOr<void> getRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getRecommendationUseCase(RecommendationParmeters(
      event.id,
    ));

    result.fold(
            (l) => emit(state.copyWith(
            recommendationState: RequestState.error,
            movieDetailsmessage: l.message
        )),
            (r) => emit(
          state.copyWith(
              recommendation: r,
              movieDetailsState: RequestState.loaded
          ) ,

        ));
  }
}
