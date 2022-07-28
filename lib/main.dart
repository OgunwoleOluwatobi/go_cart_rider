import 'package:flutter/material.dart';
import 'package:go_cart_rider/core/constants/setup_dialog.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/core/utils/preload_images_util.dart';
import 'package:go_cart_rider/ui/views/splash/splash_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:go_cart_rider/styles/theme/theme.dart' as _theme;
import 'package:stacked_services/stacked_services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    Utils.darkWhiteNav
  );
  await DotEnv.load(fileName: '.env');
  setupLogger();
  await setupLocator();
  await PreloadImageUtil.loadCacheImages();
  setupDialog();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final StorageService _storageService = locator<StorageService>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (c, _) => MaterialApp(
        title: 'Go Cart',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routers().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        theme: _theme.lightTheme,
        home: SplashView(),
      ),
    );
  }
}
