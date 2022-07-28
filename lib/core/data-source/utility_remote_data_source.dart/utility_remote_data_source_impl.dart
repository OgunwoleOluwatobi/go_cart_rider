import 'package:dartz/dartz.dart';
import 'package:go_cart_rider/core/data-source/utility_remote_data_source.dart/utility_remote_data_source.dart';
import 'package:go_cart_rider/core/exceptions/auth_exception.dart';
import 'package:go_cart_rider/core/models/formatted_response.dart';
import 'package:go_cart_rider/core/utils/exports.dart';

class UtilityRemoteDataSourceImpl extends UtilityRemoteDataSource {
  final HttpService _httpService = locator<HttpService>();

}