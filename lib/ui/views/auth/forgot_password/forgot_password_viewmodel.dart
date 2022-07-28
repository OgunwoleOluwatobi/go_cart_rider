import 'package:go_cart_rider/core/data-source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();

  String? email;

  void setEmail(String val) {
    email = val;
    notifyListeners();
  }

  Future reset() async{
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withOpacity(0.8),
      title: 'Please wait...',
    );
    
    final data = await _authRemoteDataSource.resetPassword(
      email: email!
    );
    
    data.fold(
      (l) {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message);
      },
      (r) async{
        _dialogService.completeDialog(DialogResponse());
        _navigationService.back();
        flusher('Password reset link sent to email.', color: Colors.green);
      }
    );
  }
}