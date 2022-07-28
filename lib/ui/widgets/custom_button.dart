import 'package:go_cart_rider/core/utils/exports.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool rounded;
  final bool filled;
  final Color? color;
  final Color? textColor;
  final double? textSize;
  final double? height;
  final double? borderRadius;
  final bool disable;
  final bool gradient;

  const CustomButton({Key? key, required this.title, required this.onTap, this.rounded = true, this.filled = true, this.color, this.textColor, this.textSize, this.height, this.disable = false, this.gradient = true, this.borderRadius}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()  {
        if(!disable) onTap();
      },
      borderRadius: BorderRadius.circular(rounded ? 16.r : 0),
      child: Opacity(
        opacity: disable ? .5 : 1,
        child: Container(
          height: height,
          padding: height != null ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: gradient ? null : filled ? color == null ? BrandColors.secondary : color : Colors.transparent,
            border: Border.all(
              color: filled ? Colors.transparent : color == null ?  BrandColors.secondary : color!
            ),
            borderRadius: BorderRadius.circular(rounded ? borderRadius ?? 10.r : 0),
            gradient: gradient ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                BrandColors.primary,
                BrandColors.primary
              ]
            ) : null
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '$title',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: textColor == null ? filled || color != null ? Colors.white : BrandColors.primary : textColor,
                  fontSize: textSize ?? 15.sp,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}