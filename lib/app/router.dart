import 'package:flutter/cupertino.dart';
import 'package:go_cart_rider/ui/views/auth/forgot_password/forgot_password_view.dart';
import 'package:go_cart_rider/ui/views/auth/login/login_view.dart';
import 'package:go_cart_rider/ui/views/auth/register/register_view.dart';
import 'package:go_cart_rider/ui/views/auth/verify_mail/verify_mail_view.dart';
import 'package:go_cart_rider/ui/views/dashboard/dashboard_view.dart';
import 'package:go_cart_rider/ui/views/orders/order_view.dart';
import 'package:go_cart_rider/ui/views/profile/profile_view.dart';
import 'package:go_cart_rider/ui/views/referrals/referrals_view.dart';
import 'package:go_cart_rider/ui/views/send_package/send_package_view_holder.dart';
import 'package:go_cart_rider/ui/views/splash/splash_view.dart';
import 'package:go_cart_rider/ui/widgets/coming_soon.dart';

import '../core/utils/exports.dart';

abstract class Routes {
  static const splash = '/splash';
  static const main = '/main';
  static const comingSoon = '/comingSoon';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const register = '/register';
  static const verifyMail = '/verifyMail';
  static const dashboard = '/dashboard';
  static const forgotPassword = '/forgotPassword';
  static const profile = '/profile';
  static const orders = '/orders';
  static const referrals = '/referrals';
  static const sendPackage = '/sendPackage';
}

class Routers {

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => SplashView(),
          settings: settings
        );
      case Routes.main:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => DashboardView(),
          settings: settings
        );
      case Routes.dashboard:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => DashboardView(),
          settings: settings
        );
      case Routes.comingSoon:
      String? title = settings.arguments as String?;
        return CupertinoPageRoute<dynamic>(
          builder: (context) => ComingSoon(
            title: title ?? '',
          ),
          settings: settings
        );
      case Routes.login:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => LoginView(),
          settings: settings
        );
      case Routes.register:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => RegisterView(),
          settings: settings
        );
      case Routes.verifyMail:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => VerifyMailView(),
          settings: settings
        );
      case Routes.forgotPassword:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => ForgotPasswordView(),
          settings: settings
        );
      case Routes.profile:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => ProfileView(),
          settings: settings
        );
      case Routes.orders:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => OrdersView(),
          settings: settings
        );
      case Routes.referrals:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => ReferralsView(),
          settings: settings
        );
      case Routes.sendPackage:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => SendPackageView(),
          settings: settings
        );
      default:
        return unknownRoutePage(settings.name!);
    }
  }
}

// borrowed from auto_route:
// returns an error page routes with a helper message.
PageRoute unknownRoutePage(String routeName) => CupertinoPageRoute(
  builder: (ctx) => Scaffold(
    body: Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Text(
              routeName == "/"
                  ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                  : 'Route name $routeName is not found!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          OutlinedButton.icon(
            label: Text('Back'),
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(ctx).pop(),
          )
        ],
      ),
    ),
  ),
);