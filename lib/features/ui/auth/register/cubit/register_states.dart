import 'package:e_commerce_app/core/errors/errors.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterErrorStates extends RegisterStates {
  Errors errors; // علشان هو جواه ال error message
  RegisterErrorStates({required this.errors});

  /// String errorMessage
}

class RegisterSuccessStates extends RegisterStates {
  RegisterResponseEntity
  responseEntity; // علشان احنا بقينا بنتعامل مع ال domain
  RegisterSuccessStates({required this.responseEntity});
}
