import 'package:flutter_test/flutter_test.dart';
import 'package:go_cart_rider/app/locator.dart';
import 'package:go_cart_rider/core/utils/logger.dart';

void main() {
  test('Setup is working', () async{
    TestWidgetsFlutterBinding.ensureInitialized();

    locator.allowReassignment = true;
    setupLogger(test: true);

    await setupLocator(test: true);

    await locator.allReady();
  });
}