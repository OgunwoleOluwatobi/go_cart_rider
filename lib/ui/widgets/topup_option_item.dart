import 'package:go_cart_rider/core/utils/exports.dart';

class TopupOptionItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function onTap;

  const TopupOptionItem({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: BrandColors.light2,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 35.h,
            ),
            SizedBox(width: 20.w,),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}