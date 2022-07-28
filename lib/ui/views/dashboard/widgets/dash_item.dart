import 'package:go_cart_rider/core/utils/exports.dart';

class DashItem extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final Function onTap;
  
  const DashItem({ Key? key, required this.title, required this.image, required this.color, required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 130.w,
        child: Column(
          children: [
            Container(
              width: 93.w,
              height: 85.h,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10.r)
              ),
              child: Center(
                child: Image.asset(
                  image,
                  height: 47.h,
                ),
              ),
            ),
            SizedBox(height: 12.h,),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 12.sp,
                color: Colors.black
              ),
            )
          ],
        ),
      ),
    );
  }
}