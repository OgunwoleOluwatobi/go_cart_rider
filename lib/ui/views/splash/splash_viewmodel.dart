import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  bool show = false;
  Duration duration = Duration(milliseconds: 350);

  void setShow() {
    show = !show;
    notifyListeners();
  }

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.login);
  }

  void navigateToRegister() {
    _navigationService.navigateTo(Routes.register);
  }
}