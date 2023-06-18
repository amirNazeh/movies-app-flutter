import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_player/core/error/failure.dart';

abstract class BaseUseCase<T , parameters>{
  Future<Either<Failure , T>> call(parameters parameters);
}

class NoParameter extends Equatable{
  const NoParameter();

  @override
  List<Object?> get props =>[];
}