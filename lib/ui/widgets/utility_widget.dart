import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomToast {
  static void show(
    String msg, 
    {
      Color? backgroundColor,
      double? fontSize,
      ToastGravity? gravity
    }) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Colors.black54,
      textColor: Colors.white,
      fontSize: fontSize ?? 14.sp);

  static void cancelAll() => Fluttertoast.cancel();
}

Widget profileItem({required String icon, title, subtext, required Function onTap}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.h),
    child: InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r)
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 40.h,
            ),
            SizedBox(width: 15.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(StackedService.navigatorKey!.currentContext!).textTheme.headline6!.copyWith(
                      fontSize: 17.sp,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    subtext,
                    style: Theme.of(StackedService.navigatorKey!.currentContext!).textTheme.headline3!.copyWith(
                      fontSize: 12.sp,
                      color: Colors.black54
                    ),
                  )
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.h,
              color: BrandColors.primary,
            )
          ],
        ),
      ),
    ),
  );
}

Widget helpItem(String title) {
  return Theme(
    data: ThemeData(
      backgroundColor: BrandColors.primary,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      accentColor: Colors.white,
      dividerColor: Colors.white,
      primaryColor: Colors.white,
      unselectedWidgetColor: Colors.white
    ),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.r),
        child: ExpansionTile(
          backgroundColor: BrandColors.primary,
          collapsedBackgroundColor: BrandColors.primary,
          title: Text(
            title,
            style: Theme.of(StackedService.navigatorKey!.currentContext!).textTheme.headline6!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
      ),
    ),
  );
}

Widget keysItem({required BuildContext context, required String range, desc, required Color color1, color2}) {
  return Row(
    children: [
      Container(
        width: 40.h,
        height: 40.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              color1,
              color2
            ]
          )
        ),
      ),
      SizedBox(width: 30.w,),
      Container(
        width: 70.w,
        child: Text(
          range,
          style: Theme.of(context).textTheme.headline4!.copyWith(
            color: Color(0xFF718096),
            fontSize: 14.sp
          ),
        ),
      ),
      SizedBox(width: 15.w,),
      Container(
        width: 80.w,
        child: Text(
          desc,
          style: Theme.of(context).textTheme.headline5!.copyWith(
            color: color1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600
          ),
        ),
      )
    ],
  );
}

selectImageSource({required BuildContext context, required Function func}) {
    return showModalBottomSheet(
      context: context, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          topLeft: Radius.circular(25.r),
        )
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (c) => Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Text(
                'Select Source',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w800
                )
              ),
            ),
            SizedBox(height: 8.h,),
            Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.r),
                  topLeft: Radius.circular(25.r),
                )
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(width: 30.w,),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          func(ImageSource.camera);
                        },
                        child: sourceItem(
                          context: context,
                          image: 'camera'.svg,
                          name: 'Camera',
                          color: Color(0xFF18A4E0)
                        ),
                      ),
                      SizedBox(width: 30.w,),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          func(ImageSource.gallery);
                        },
                        child: sourceItem(
                          context: context,
                          image: 'gallery'.svg,
                          name: 'Gallery',
                          color: Color(0xFFFBCC38)
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      )
    );
}

Widget sourceItem({required BuildContext context, required String image, name, required Color color}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      CircleAvatar(
        radius:25.r,
        backgroundColor: color,
        child: Center(
          child: SvgPicture.asset(
            image
          ),
        ),
      ),
      SizedBox(height: 6.h,),
      Text(
        name,
        style: Theme.of(context).textTheme.headline3!.copyWith(
          fontSize: 14.sp,
          color: Color(0xFF757575)
        )
      )
    ],
  );
}

Widget nairaText({required String text, required TextStyle style, bool symbolcolor = false}) {
  return RichText(
    text: TextSpan(
      style: style.copyWith(
        fontFamily: 'Roboto',
        // color: symbolcolor ? BrandColors.primary : null,
        // fontSize: 26.sp
      ),
      text: '₦',
      children: [
        TextSpan(
          text: '$text',
          style: style,
        )
      ]
    ),
  );
}

Widget textItem({
    required BuildContext context,
    required String title,
    required String value,
    bool amount = false
  }) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.black,
            fontSize: 14.sp
          ),
        ),
        SizedBox(width: 5.w,),
        Expanded(
          child: amount ? nairaText(
            text: value,
            style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Colors.black,
              fontSize: 15.sp
            ),
          ) : Text(
            value,
            style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Colors.black,
              fontSize: 15.sp
            ),
          ),
        ),
      ],
    );
  }