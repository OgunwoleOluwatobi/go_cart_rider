
import 'package:go_cart_rider/core/utils/exports.dart';

class PreloadImageUtil {
  PreloadImageUtil._();

  static Future<void> loadCacheImages() async {
    final imageDecoder = SvgPicture.svgStringDecoder;
    Future.wait([
      // precachePicture(
      //   ExactAssetPicture(imageDecoder, 'success_loan'.svg),
      //   null,
      // ),
      // precachePicture(
      //   ExactAssetPicture(imageDecoder, 'empty_card'.svg),
      //   null,
      // ),
      // other SVGs or images here
    ]);
  }
}