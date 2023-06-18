
import '../network/error_massege_model.dart';

class ServerException implements Exception{
  final ErrorMassegeModel errorMassegeModel;
  const ServerException({
    required this.errorMassegeModel
});
}

class LocalDatabaseException implements Exception{
  final String Massege;
  const LocalDatabaseException({
    required this.Massege
  });
}