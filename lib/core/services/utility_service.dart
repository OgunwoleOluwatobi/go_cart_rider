import 'package:go_cart_rider/core/data-source/utility_remote_data_source.dart/utility_remote_data_source.dart';
import 'package:go_cart_rider/core/utils/exports.dart';

class UtilityService with ReactiveServiceMixin {
  final UtilityRemoteDataSource _utilityRemoteDataSource = locator<UtilityRemoteDataSource>();

  UtilityService(){
    listenToReactiveValues([
    ]);
  }
}