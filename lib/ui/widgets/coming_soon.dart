import 'package:go_cart_rider/core/utils/exports.dart';

class ComingSoon extends StatelessWidget {
  final String title;

  const ComingSoon({Key? key, required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title
        ),
      ),
      body: Center(
        child: Text(
          'Coming Soon...',
          style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.black,
            fontSize: 30.sp
          ),
        ),
      ),
    );
  }
}