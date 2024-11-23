import 'package:dio/dio.dart';
import 'package:final_project/core/utils/api_service.dart';
import 'package:final_project/features/login/data/repository/user_login_repo_impl.dart';
import 'package:final_project/features/register/data/repository/user_register_repo_impl.dart';
import 'package:final_project/features/verify_code/data/repository/resend_repository/resend_repo_impl.dart';
import 'package:final_project/features/verify_code/data/repository/verify_repository/verify_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton(
    UserRegisterRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

   getIt.registerSingleton(
    UserLoginRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    ResendRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    VerifyRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
