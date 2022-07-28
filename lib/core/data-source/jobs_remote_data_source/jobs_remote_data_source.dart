import 'package:dartz/dartz.dart';
import 'package:go_cart_rider/core/models/app_error.dart';
import 'package:go_cart_rider/core/models/user.dart';

abstract class JobsRemoteDataSource {
  Future<Either<AppError, dynamic>> fetchJobs(String date);
}