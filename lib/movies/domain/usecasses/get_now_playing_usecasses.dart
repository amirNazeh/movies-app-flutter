import 'package:dartz/dartz.dart';
import 'package:movie_player/core/usecasse/base_usecass.dart';
import 'package:movie_player/movies/domain/entities/movie.dart';
import 'package:movie_player/movies/domain/repository/base_movies_rebository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie> , NoParameter>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure , List<Movie>>> call(NoParameter parmeter)async{
    return await baseMoviesRepository.getNowPlaying();
  }

}