import 'package:dartz/dartz.dart';
import 'package:go_cart_rider/core/data-source/profile_remote_data_source/profile_remote_data_source.dart';
import 'package:go_cart_rider/core/models/formatted_response.dart';
import 'package:go_cart_rider/core/models/user.dart';
import 'package:go_cart_rider/core/utils/exports.dart';

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final HttpService _httpService = locator<HttpService>();

  @override
  Future<Either<AppError, User>> fetchProfile({
    required String userId
  }) async{
    try {
      final FormattedResponse raw = await _httpService.getHttp('/user/$userId');
      if(raw.success) {
        return Right(User.fromJson(raw.data));
      } else {
        return Left(AppError(errorType: AppErrorType.network, message: (raw.message??'An Error Occured')));
      }
    } on NetworkException catch(e) {
      return Left(AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch(e) {
      return Left(AppError(errorType: AppErrorType.network, message: e.message));
    } on AuthException catch(e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.message));
    } on Exception catch(e) {
      return Left(AppError(errorType: AppErrorType.api, message: '$e'));
    }
  }

  @override
  Future<Either<AppError, dynamic>> updateProfile({
    required String firstName,
    required String lastName,
    required String otherName,
    required String phone,
    required String address,
    required String email,
    required String dob
  }) async{

    final Map<String, dynamic> payload = {
      'first_name': firstName,
      'last_name': lastName,
      'other_name': otherName,
      'phone': phone,
      'address': address,
      'email': email,
      'dob': dob
    };

    try {
      final FormattedResponse raw = await _httpService.postHttp('/auth/user/update', payload);
      if(raw.success) {
        return Right(raw.data);
      } else {
        return Left(AppError(errorType: AppErrorType.network, message: (raw.message ?? 'An Error Occured')));
      }
    } on NetworkException catch(e) {
      return Left(AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch(e) {
      return Left(AppError(errorType: AppErrorType.network, message: e.message));
    } on AuthException catch(e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.message));
    } on Exception catch(e) {
      return Left(AppError(errorType: AppErrorType.api, message: '$e'));
    }
  }
}