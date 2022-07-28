import 'package:go_cart_rider/core/data-source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:go_cart_rider/core/services/user_service.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final UserService _userService = locator<UserService>();
  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();
  final StorageService _storageService = locator<StorageService>();

  String? firstname;
  String? lastname;
  String? address;
  String? plate;
  String? email;
  String? password;
  String? cPassword;
  String? lat;
  String? lng;
  bool obscure1 = true;
  bool obscure2 = true;

  void setObscure(int index) {
    if(index == 1) {
      obscure1 = !obscure1;
    } else {
      obscure2 = !obscure2;
    }
    notifyListeners();
  }

  void setFirstname(String val) {
    firstname = val;
    notifyListeners();
  }

  void setLastname(String val) {
    lastname = val;
    notifyListeners();
  }

  void setAddress(String val) {
    address = val;
    notifyListeners();
  }

  void setLocation(String lat, String lng) {
    lat = lat;
    lng = lng;
    notifyListeners();
  }

  void setPlate(String val) {
    plate = val;
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

  void setCPassword(String val) {
    cPassword = val;
    notifyListeners();
  }

  Future register() async{
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withOpacity(0.8),
      title: 'Please wait while we get you started...',
    );
    
    final data = await _authRemoteDataSource.register(
      firstname: firstname!,
      lastname: lastname!,
      address: address!,
      plateNumber: plate!,
      email: email!,
      password: password!,
      lat: lat!,
      lng: lng!
    );
    
    data.fold(
      (l) {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, type: FlusherColorType.error);
      },
      (r) async{
        _storageService.addBool('onboarded', true);
        _userService.addUser(r..email = email);
        _dialogService.completeDialog(DialogResponse());
        _navigationService.replaceWith(Routes.verifyMail);
      }
    );
  }
}