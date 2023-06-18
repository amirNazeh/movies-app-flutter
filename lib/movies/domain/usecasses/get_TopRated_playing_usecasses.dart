import 'package:dartz/dartz.dart';
import 'package:movie_player/movies/domain/entities/movie.dart';
import 'package:movie_player/movies/domain/repository/base_movies_rebository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecasse/base_usecass.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameter>{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure , List<Movie>>> call(NoParameter parameter)async{
    return await baseMoviesRepository.getTopRatedMovies();
  }


}