import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/ui/views/splash/splash_viewmodel.dart';
import 'package:go_cart_rider/ui/widgets/animation/fade_in.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) {
        Timer(new Duration(seconds: 3), () {
          model.setShow();
        });
      },
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: model.duration,
              left: 0,
              right: 0,
              top: model.show ? -200.h : 0,
              bottom: 0,
              child: Center(
                child: FadeIn(
                  child: Image.asset(
                    'logo'.png,
                    height: 258.h,
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: model.duration,
              opacity: model.show ? 1 : 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      title: 'Existing User',
                      onTap: () => model.navigateToLogin()
                    ),
                    SizedBox(height: 30.h,),
                    CustomButton(
                      title: 'New User',
                      onTap: () => model.navigateToRegister()
                    ),
                    SizedBox(height: 30.h,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}