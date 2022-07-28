import 'package:hive/hive.dart';
import 'package:go_cart_rider/core/models/user.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/core/utils/hive_boxes.dart';

class UserService with ReactiveServiceMixin {
  User? _user;
  User? get user => _user;
  
  final _hiveService = locator<HiveInterface>();

  bool get _isBoxOpen => _hiveService.isBoxOpen(HiveBox.user);
  Box<User> get _userBox => _hiveService.box<User>(HiveBox.user);

  UserService(){
    listenToReactiveValues([_user]);
  }

  Future<void> init() async{
    _hiveService.registerAdapter(UserAdapter());

    if (!_isBoxOpen) {
      await _hiveService.openBox<User>(HiveBox.user);
    }
  }

  // Future addPassword(String password) async{
  //   getUser();
  //   final User updatedUser = _user!..password = password;
  //   await _userBox.putAt(0, updatedUser);
  //   getUser();
  // }

  Future addUser(User user) async{
    await _userBox.put(0, user);
    getUser();
  }

  void getUser() {
    _user = _userBox.get(0);
    notifyListeners();
  }

  void clear() {
    _userBox.clear();
    getUser();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}