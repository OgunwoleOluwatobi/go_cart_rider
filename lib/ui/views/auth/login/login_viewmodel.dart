import 'package:go_cart_rider/core/data-source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:go_cart_rider/core/models/user.dart';
import 'package:go_cart_rider/core/services/user_service.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final UserService _userService = locator<UserService>();
  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();
  final StorageService _storageService = locator<StorageService>();

  User? get user => _userService.user;

  String? username;
  String? email;
  String? password;
  bool obscure = true;

  void setup() {
    _userService.getUser();
  }

  void setObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  void setEmail(String val) {
    email = val;
    notifyListeners();
  }

  void setPassword(String val) {
    password = val;
    notifyListeners();
  }

  Future login() async{
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withOpacity(0.8),
      title: 'Welcome, Please wait...',
    );
    
    final data = await _authRemoteDataSource.login(
      email: email!,
      password: password!
    );
    
    data.fold(
      (l) {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, type: FlusherColorType.error);
      },
      (r) async{
        _storageService.addBool('loggedIn', true);
        _userService.addUser(r);
        _dialogService.completeDialog(DialogResponse());
        _navigationService.clearStackAndShow(Routes.dashboard);
      }
    );
  }

  void navigateToRegister() {
    _navigationService.navigateTo(Routes.register);
  }
  
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_userService];
}