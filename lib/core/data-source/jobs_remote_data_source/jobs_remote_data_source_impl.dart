import 'package:dartz/dartz.dart';
import 'package:go_cart_rider/core/data-source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:go_cart_rider/core/data-source/jobs_remote_data_source/jobs_remote_data_source.dart';
import 'package:go_cart_rider/core/exceptions/auth_exception.dart';
import 'package:go_cart_rider/core/models/formatted_response.dart';
import 'package:go_cart_rider/core/models/user.dart';
import 'package:go_cart_rider/core/utils/exports.dart';

class JobsRemoteDataSourceImpl extends JobsRemoteDataSource {
  final HttpService _httpService = locator<HttpService>();

  @override
  Future<Either<AppError, dynamic>> fetchJobs(String date) async{
    try {
      final FormattedResponse raw = await _httpService.getHttp('/rider/jobs/available?before=$date');
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
}
