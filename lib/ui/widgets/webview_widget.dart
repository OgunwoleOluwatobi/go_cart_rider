import 'package:flutter/foundation.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:go_cart_rider/core/utils/exports.dart';

class WebViewWidget extends StatefulWidget {
  final String url;

  const WebViewWidget({Key? key, required this.url}) : super(key: key);
  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  final FlutterWebviewPlugin flutterWebviewPlugin = locator<FlutterWebviewPlugin>();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(10.h),
              child: GestureDetector(
                onTap: Navigator.of(context, rootNavigator: true).pop,
                child: CircleAvatar(
                  radius: 16.r,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 20.h,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: WebviewScaffold(
              // javascriptMode: JavascriptMode.unrestricted,
              // gestureRecognizers: Set()
              // ..add(
              //   Factory<VerticalDragGestureRecognizer>(
              //     () => VerticalDragGestureRecognizer(),
              //   ),
              // ),
              url: widget.url,
              // onPageFinished: (finish) {
              //   setState(() {
              //     isLoading = false;
              //   });
              // }
            ),
          ),
          // isLoading ? Center( child: CircularProgressIndicator(),)
          //         : Stack(),
        ],
      )
    );
  }
}