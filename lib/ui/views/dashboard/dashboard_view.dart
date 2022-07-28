import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:go_cart_rider/ui/views/dashboard/widgets/dash_item.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, model, child) => Material(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Utils.statusBarPadding),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 22.h),
                    child: GestureDetector(
                      onTap: () => model.navigateToProfile(),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35.r,
                            backgroundColor: BrandColors.primary.withOpacity(.3),
                          ),
                          SizedBox(width: 20.w,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome',
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: BrandColors.primary,
                                    fontSize: 18.h
                                  ),
                                ),
                                SizedBox(height: 4.h,),
                                Text(
                                  model.user?.username ?? '',
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 16.h
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DashItem(
                              title: 'Send package',
                              image: 'package'.png,
                              color: Color(0xFF007236),
                              onTap: () => model.navigateToSendPackage(),
                            ),
                            SizedBox(width: 30.w,),
                            DashItem(
                              title: 'Send Multiple package',
                              image: 'packages'.png,
                              color: Color(0xFFFFC727),
                              onTap: (){},
                            )
                          ],
                        ),
                        SizedBox(height: 40.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DashItem(
                              title: 'Manage Orders',
                              image: 'manage_orders'.png,
                              color: Color(0xFFFFC727),
                              onTap: () => model.navigateToOrders(),
                            ),
                            SizedBox(width: 30.w,),
                            DashItem(
                              title: 'Referrals',
                              image: 'package'.png,
                              color: Color(0xFF007236),
                              onTap: () => model.navigateToReferrals(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IntrinsicHeight(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: CustomButton(
                    title: 'Go Online',
                    onTap: () {}
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}