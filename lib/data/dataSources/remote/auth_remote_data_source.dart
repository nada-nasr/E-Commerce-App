import 'package:dartz/dartz.dart';

import '../../../core/errors/errors.dart';
import '../../../domain/entities/RegisterResponseEntity.dart';

/// interface
abstract class AuthRemoteDataSource {
  Future<Either<Errors, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
