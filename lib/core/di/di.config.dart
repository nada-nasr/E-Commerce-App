// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/dataSources/remote/auth_remote_data_source.dart' as _i499;
import '../../data/dataSources/remote/impl/auth_remote_data_source_impl.dart'
    as _i702;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/useCases/register_use_case.dart' as _i372;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i499.AuthRemoteDataSource>(
      () => _i702.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i660.AuthRepository>(
      () => _i24.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i499.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i372.RegisterUseCase>(
      () => _i372.RegisterUseCase(authRepository: gh<_i660.AuthRepository>()),
    );
    gh.factory<_i873.RegisterViewModel>(
      () =>
          _i873.RegisterViewModel(registerUseCase: gh<_i372.RegisterUseCase>()),
    );
    return this;
  }
}
