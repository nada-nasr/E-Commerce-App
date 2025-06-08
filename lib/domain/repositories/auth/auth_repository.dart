import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/errors.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Errors, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
