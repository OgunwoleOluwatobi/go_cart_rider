import 'package:go_cart_rider/core/models/user.dart';
import 'package:go_cart_rider/core/services/user_service.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  
  User? get user => _userService.user;

  void navigateToProfile() {
    _navigationService.navigateTo(Routes.profile);
  }

  void navigateToOrders() {
    _navigationService.navigateTo(Routes.orders);
  }

  void navigateToReferrals() {
    _navigationService.navigateTo(Routes.referrals);
  }

  void navigateToSendPackage() {
    _navigationService.navigateTo(Routes.sendPackage);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_userService];
}