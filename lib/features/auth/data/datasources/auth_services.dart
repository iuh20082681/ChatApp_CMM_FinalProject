import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../configs/constants/constants.dart';
import '../models/user_model.dart';

part 'auth_services.g.dart';

@RestApi(baseUrl: baseApiUrl)
abstract class AuthServices {
  factory AuthServices(Dio dio) = _AuthServices;

  @GET('/users/find/{email}')
  Future<HttpResponse<UserModel>> findUserByEmail({
    @Path() String? email,
  });

  @POST('/users/add')
  Future<HttpResponse<UserModel>> registryNewUser({
    @Body() UserModel? user,
  });

  @GET('/users/auth/login')
  Future<HttpResponse<UserModel>> loginUser({
    @Query("email") required String email,
    @Query("password") required String password,
  });
}
