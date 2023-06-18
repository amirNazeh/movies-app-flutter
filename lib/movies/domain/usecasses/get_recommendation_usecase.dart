import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_player/core/error/failure.dart';
import 'package:movie_player/core/usecasse/base_usecass.dart';
import 'package:movie_player/movies/domain/entities/recommendation.dart';
import 'package:movie_player/movies/domain/repository/base_movies_rebository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>,RecommendationParmeters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParmeters parameters) async{
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParmeters extends Equatable{
  final int id;

  const RecommendationParmeters(this.id);



  @override
  // TODO: implement props
  List<Object?> get props => [id];

}