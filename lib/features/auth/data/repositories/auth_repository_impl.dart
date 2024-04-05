import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../configs/resources/data_state.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_services.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthServices authServices;

  AuthRepositoryImpl({required this.authServices});

  @override
  Future<DataState<UserModel>> findUserByEmail({required String email}) async {
    try {
      final HttpResponse<UserModel> httpResponse =
          await authServices.findUserByEmail(email: email);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }

  @override
  Future<DataState<UserModel>> registryNewUser({required User user}) async {
    try {
      final HttpResponse<UserModel> httpResponse =
          await authServices.registryNewUser(user: UserModel.fromUser(user));

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }

  @override
  Future<DataState<UserModel>> login(
      {required String email, required String password}) async {
    try {
      final httpRespone =
          await authServices.loginUser(email: email, password: password);

      if (httpRespone.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpRespone.data);
      } else {
        return DataFailed(
          DioException(
            error: httpRespone.response.statusMessage,
            response: httpRespone.response,
            type: DioExceptionType.badResponse,
            requestOptions: RequestOptions(),
          ),
        );
      }
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }
}
