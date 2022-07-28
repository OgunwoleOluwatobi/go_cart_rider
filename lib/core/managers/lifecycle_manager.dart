import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;

  const LifeCycleManager({Key? key, required this.child}) : super(key: key);
  
  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager> with WidgetsBindingObserver {
  final NavigationService _navigationService = locator<NavigationService>();
  // final StorageService _storageService = locator<StorageService>();

  static const _inactivityTimeout = Duration(minutes: 15);
  Timer? _keepAliveTimer;

  void _keepAlive(bool visible) {
    if(env['APP_DEBUG'] == 'false') {
      _keepAliveTimer?.cancel();
      if (visible) {
        _keepAliveTimer = null;
      } else {
        _keepAliveTimer = Timer(_inactivityTimeout, () {
          // _userService.clearUser();
          if(_navigationService.currentRoute != Routes.splash) {
            // _storageService.addBool('isLoggedIn', false);
            _navigationService.clearStackAndShow(Routes.splash);
          }
        });
      }
    }
  }

  @override
  void initState() {
    _keepAlive(false);
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _keepAlive(false),
      onPanDown: (_) => _keepAlive(false),
      child: widget.child
    );
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    switch(state) {
      case AppLifecycleState.resumed:
        _keepAlive(false);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _keepAlive(false);
        break;
    }
  }
}
