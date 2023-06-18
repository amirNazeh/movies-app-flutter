import 'package:equatable/equatable.dart';

class ErrorMassegeModel extends Equatable {
 final int statusCode;
 final String statusMessage;
 final bool success;

  const ErrorMassegeModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success
  });

  factory ErrorMassegeModel.fromJson(Map<String,dynamic>json){
    return ErrorMassegeModel(
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        success: json['success']
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    statusCode,
    statusMessage,
    success
  ];
}