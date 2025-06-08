import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/errors/errors.dart';
import 'package:e_commerce_app/data/dataSources/remote/auth_remote_data_source.dart';
import 'package:e_commerce_app/data/models/RegisterResponseDM.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Errors, RegisterResponseDm>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet connection
        var response = await apiManager.postData(
          endPoint: EndPoints.signUp,
          body: {
            "name": name,
            "email": email,
            "password": password,
            "rePassword": rePassword,
            "phone": phone,
          },
        );
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo server => success
          return Right(registerResponse);
        } else {
          //todo server => error
          return left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        //todo: no internet
        return left(
          NetworkError(
            errorMessage: 'No Internet Connection, Please check connection.',
          ),
        );
      }
    } catch (e) {
      return left(Errors(errorMessage: e.toString()));
    }
  }
}
