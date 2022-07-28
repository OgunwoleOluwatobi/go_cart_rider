import 'package:dartz/dartz.dart';
import 'package:go_cart_rider/core/data-source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:go_cart_rider/core/exceptions/auth_exception.dart';
import 'package:go_cart_rider/core/models/formatted_response.dart';
import 'package:go_cart_rider/core/models/user.dart';
import 'package:go_cart_rider/core/utils/exports.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final HttpService _httpService = locator<HttpService>();

  @override
  Future<Either<AppError, User>> register({
    required String firstname,
    required String lastname,
    required String email,
    required String address,
    required String password,
    required String plateNumber,
    required String lat,
    required String lng
  }) async{

    final Map<String, dynamic> payload = {
      'firstname': firstname,
      'lastname': lastname,
      'address': address,
      'plate_number': plateNumber,
      'email': email,
      'password': password,
      'lnglat': {
        'lng': lng,
        'lat': lat
      }
    };

    try {
      final FormattedResponse raw = await _httpService.postHttp('/rider', payload);
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
  Future<Either<AppError, User>> login({
    required String email,
    required String password
  }) async{

    final Map<String, dynamic> payload = {
      'email': email,
      'password': password,
      'type': 'rider'
    };

    try {
      final FormattedResponse raw = await _httpService.postHttp('/auth/login', payload);
      if(raw.success) {
        return Right(User.fromJson(raw.data));
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

  @override
  Future<Either<AppError, dynamic>> resendToken({
    required String email
  }) async{

    try {
      final FormattedResponse raw = await _httpService.getHttp('/auth/email_veri/token?email=$email&type=rider');
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

  @override
  Future<Either<AppError, dynamic>> verifyToken({
    required String email,
    required String token
  }) async{
    Map<String, dynamic> payload = {
      'email': email,
      'token': token,
      'type': 'rider'
    };

    try {
      final FormattedResponse raw = await _httpService.postHttp('/auth/email_veri/token', payload);
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

  @override
  Future<Either<AppError, dynamic>> resetPassword({
    required String email,
  }) async{

    final Map<String, dynamic> payload = {
      'email': email,
      'type': 'rider'
    };

    try {
      final FormattedResponse raw = await _httpService.postHttp('/auth/reset', payload);
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

  @override
  Future<Either<AppError, User>> getUser() async{
    try {
      final FormattedResponse raw = await _httpService.getHttp('/auth/user');
      if(raw.success) {
        return Right(User.fromJson(raw.data));
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