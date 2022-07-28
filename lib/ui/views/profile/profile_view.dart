import 'package:go_cart_rider/core/utils/exports.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackWrapper(
      title: 'Profile',
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 44.r,
                backgroundColor: BrandColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}