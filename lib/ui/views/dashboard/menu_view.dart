import 'package:flutter/material.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:go_cart_rider/ui/views/orders/order_view.dart';
import 'package:go_cart_rider/ui/views/payment/payment_view.dart';
import 'package:go_cart_rider/ui/views/profile/profile_view.dart';
import 'package:go_cart_rider/ui/views/referrals/referrals_view.dart';
import 'package:go_cart_rider/ui/views/support/support_view.dart';
import 'package:stacked_services/stacked_services.dart';

class MenuView extends StatelessWidget {
  const MenuView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactivePartialBuild<DashboardViewModel>(
      builder: (context, model) => Material(
        color: Colors.white,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 160.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF039448),
                      Color(0xFF00AE53).withOpacity(.1)
                    ]
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(width: 24.w,),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              model.user?.username ?? '',
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Text(
                              model.user?.email ?? '',
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
                  children: [
                    drawerItem(
                      context: context,
                      name: 'Profile',
                      icon: 'profile'.svg,
                      view: ProfileView()
                    ),
                    drawerItem(
                      context: context,
                      name: 'Payment',
                      icon: 'payment'.svg,
                      view: PaymentView()
                    ),
                    drawerItem(
                      context: context,
                      name: 'Orders',
                      icon: 'orders'.svg,
                      view: OrdersView()
                    ),
                    drawerItem(
                      context: context,
                      name: 'Referrals',
                      icon: 'referrals'.svg,
                      view: ReferralsView()
                    ),
                    drawerItem(
                      context: context,
                      name: 'Support',
                      icon: 'support'.svg,
                      view: SupportView()
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  Widget drawerItem({
    required BuildContext context,
    required String name,
    required String icon,
    required Widget view
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        locator<NavigationService>().navigateToView(view);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.only(left: 40.w, top: 25.h, bottom: 30.h),
        child: Row(
          children: [
            Container(
              width: 26.h,
              height: 26.h,
              child: SvgPicture.asset(
                icon,
                height: 25.h,
              ),
            ),
            SizedBox(width: 30.w,),
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}