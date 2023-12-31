part of 'movie_details_bloc.dart';

 class MovieDetailsState extends Equatable {
  const MovieDetailsState( {
     this.movieDetail,
     this.movieDetailsState=RequestState.loading,
     this.movieDetailsmessage='',
    this.recommendation=const[],
    this.recommendationState=RequestState.loading,
    this.recommendationmessage='',
  });

  final MovieDetail? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailsmessage;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationmessage;

  MovieDetailsState copyWith({
     MovieDetail? movieDetail,
     RequestState? movieDetailsState,
     String? movieDetailsmessage,
     List<Recommendation>? recommendation,
     RequestState? recommendationState,
     String? recommendationmessage,

  }) {
    return MovieDetailsState(
     movieDetail: movieDetail??this.movieDetail,
     movieDetailsState: movieDetailsState?? this.movieDetailsState,
     movieDetailsmessage: movieDetailsmessage ?? this.movieDetailsmessage,
     recommendation: recommendation??this.recommendation,
        recommendationState: recommendationState?? this.recommendationState,
        recommendationmessage: recommendationmessage ?? this.recommendationmessage,
    );
  }

  @override

  List<Object?> get props => [
    movieDetail,
    movieDetailsState,
    movieDetailsmessage,
    recommendation,
    recommendationState,
    recommendationmessage
  ];
}


