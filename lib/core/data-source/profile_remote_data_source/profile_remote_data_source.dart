import 'package:dartz/dartz.dart';
import 'package:go_cart_rider/core/models/app_error.dart';
import 'package:go_cart_rider/core/models/user.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<AppError, User>> fetchProfile({
    required String userId
  });
  Future<Either<AppError, dynamic>> updateProfile({
    required String firstName,
    required String lastName,
    required String otherName,
    required String phone,
    required String address,
    required String email,
    required String dob
  });
}