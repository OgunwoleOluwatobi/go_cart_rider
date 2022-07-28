import 'package:go_cart_rider/core/data-source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:go_cart_rider/core/models/user.dart';
import 'package:go_cart_rider/core/services/user_service.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyMailViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final UserService _userService = locator<UserService>();
  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();

  User? get user => _userService.user;

  String? token;

  void setToken(String val) {
    token = val;
    notifyListeners();
  }

  Future resendToken() async{
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withOpacity(0.8),
      title: 'Please wait...',
    );
    
    final data = await _authRemoteDataSource.resendToken(
      email: user?.email ?? ''
    );
    
    data.fold(
      (l) {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, type: FlusherColorType.error);
      },
      (r) async{
        _dialogService.completeDialog(DialogResponse());
        flusher('Token sent!');
      }
    );
  }

  Future verify() async{
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withOpacity(0.8),
      title: 'Please wait...',
    );
    
    final data = await _authRemoteDataSource.verifyToken(
      email: user?.email ?? '',
      token: token ?? ''
    );
    
    data.fold(
      (l) {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, type: FlusherColorType.error);
      },
      (r) async{
        _dialogService.completeDialog(DialogResponse());
        _navigationService.clearStackAndShow(Routes.dashboard);
      }
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_userService];
}