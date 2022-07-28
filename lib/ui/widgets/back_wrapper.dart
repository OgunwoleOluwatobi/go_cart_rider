import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class BackWrapper extends StatelessWidget {
  final String title;
  final Widget child;
  final Color? bodyColor;
  final Color? titleColor;
  final Widget? actions;
  final Function? onBackPressed;
  final SystemUiOverlayStyle? value;
  final double? height;

  const BackWrapper({
    Key? key,
    required this.title,
    required this.child,
    this.bodyColor,
    this.titleColor,
    this.onBackPressed,
    this.actions,
    this.value,
    this.height
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: value ?? Utils.darkWhiteNav,
      child: Scaffold(
        backgroundColor: bodyColor ?? Colors.white,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top: Utils.statusBarPadding),
                      padding: EdgeInsets.only(top: Utils.statusBarPadding, left: 20.w, right: 20.w),
                      height: (height ?? 80.h) + Utils.statusBarPadding,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                color: titleColor ?? Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            bottom: 0,
                            child: Center(
                              child: StackedService.navigatorKey!.currentState!.canPop() ? InkWell(
                                onTap: () => onBackPressed == null ? Navigator.pop(context) : onBackPressed!(),
                                borderRadius: BorderRadius.circular(50.r),
                                child: SvgPicture.asset(
                                  'back'.svg,
                                  height: 22.h,
                                )
                              ) : SizedBox(),
                            ),
                          ),
                          actions == null ? SizedBox() : Positioned(
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: Center(child: actions!)
                          ),
                          // Positioned(
                          //   top: 0,
                          //   right: 0,
                          //   bottom: 0,
                          //   child: Center(
                          //     child: InkWell(
                          //       onTap: () => onBackPressed == null ? Navigator.pop(context) : onBackPressed!(),
                          //       borderRadius: BorderRadius.circular(50.r),
                          //       child: CircleAvatar(
                          //         backgroundColor: leadingBg ?? BrandColors.primaryFade,
                          //         radius: 16.r,
                          //         child: Center(
                          //           child: Icon(
                          //             Icons.arrow_back_ios_rounded,
                          //             color: leadingIconColor ?? BrandColors.primary,
                          //             size: 18.h,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: child
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}