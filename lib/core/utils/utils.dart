import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:go_cart_rider/core/data-source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:go_cart_rider/core/services/user_service.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class Utils{
  final UserService _userService = locator<UserService>();
  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();
  
  static EdgeInsets padding = EdgeInsets.only(top: MediaQuery.of(StackedService.navigatorKey!.currentContext!).padding.top + 40.h, left: 20.w, right: 20.w, bottom: 40.h);
  static double statusBarPadding = MediaQuery.of(StackedService.navigatorKey!.currentContext!).padding.top;
  static double get buttonVerticalPadding => Platform.isIOS ? 40.h : 10.h;

  static BoxDecoration roundedShadow = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(.1),
        spreadRadius: 1,
        blurRadius: 8,
        offset: const Offset(0, 1),
      ),
    ],
  );

  static final currencyFormatter2 = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 2);
  static final currencyFormatter0 = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 0);
  static final normalFormatter = NumberFormat("#,###.##");
  // static final GlobalKey<NavigatorState>? navigatorKey = StackedService.nestedNavigationKey(locator<MainViewModel>().currentIndex);
  // static final int navId = locator<MainViewModel>().currentIndex;

  static final SystemUiOverlayStyle light = Platform.isIOS ? const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  ) : const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  );

  static final SystemUiOverlayStyle lightWhiteNav = Platform.isIOS ? const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark
  ) : const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light
  );

  static final SystemUiOverlayStyle lightdarkNav = Platform.isIOS ? const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light
  ) : const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light
  );

  static final SystemUiOverlayStyle dark = Platform.isIOS ? const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  ) : const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark
  );

  static final SystemUiOverlayStyle darkWhiteNav = Platform.isIOS ? const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light
  ) : const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark
  );

  static PinTheme roundedBoxPinField = PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(15.r),
    borderWidth: 1,
    fieldHeight: 56.6.h,
    fieldWidth: 50.w,
    activeFillColor: Colors.transparent,
    inactiveFillColor: Colors.transparent,
    disabledColor: Colors.black.withOpacity(.4),
    activeColor: Colors.black.withOpacity(.4),
    inactiveColor: Colors.black.withOpacity(.4),
    selectedColor: Colors.black.withOpacity(.4),
    selectedFillColor: Colors.transparent
  );

  static List<DropdownMenuItem<T>> getDropdownItem<T>(List<T> items) {
    return items.map((T value) {
      return DropdownMenuItem<T>(
        value: value,
        child: Text(
          '$value',
          style: Theme.of(StackedService.navigatorKey!.currentContext!).textTheme.headline4!.copyWith(
            fontSize: 16.sp,
            color: const Color(0xFFACACAC),
          ),
        ),
      );
    }).toList();
  }

  // static PinTheme roundedBoxPinField = PinTheme(
  //   shape: PinCodeFieldShape.box,
  //   borderRadius: BorderRadius.circular(5.r),
  //   borderWidth: 1,
  //   fieldHeight: 50.h,
  //   fieldWidth: 50.w,
  //   activeFillColor: Colors.transparent,
  //   inactiveFillColor: Colors.transparent,
  //   disabledColor: BrandColors.darkD9,
  //   activeColor: BrandColors.darkD9,
  //   inactiveColor: BrandColors.darkD9,
  //   selectedColor: BrandColors.darkD9,
  //   selectedFillColor: Colors.transparent
  // );
}