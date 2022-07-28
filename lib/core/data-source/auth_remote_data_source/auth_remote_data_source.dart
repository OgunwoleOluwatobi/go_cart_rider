import 'package:dartz/dartz.dart';
import 'package:go_cart_rider/core/models/app_error.dart';
import 'package:go_cart_rider/core/models/user.dart';

abstract class AuthRemoteDataSource {
  Future<Either<AppError, User>> register({
    required String firstname,
    required String lastname,
    required String email,
    required String address,
    required String password,
    required String plateNumber,
    required String lat,
    required String lng
  });
  Future<Either<AppError, User>> login({
    required String email,
    required String password
  });
  Future<Either<AppError, dynamic>> resendToken({
    required String email
  });
  Future<Either<AppError, dynamic>> verifyToken({
    required String email,
    required String token
  });
  Future<Either<AppError, dynamic>> resetPassword({
    required String email,
  });
  Future<Either<AppError, User>> getUser();
}