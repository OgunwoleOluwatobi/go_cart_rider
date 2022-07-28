import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:intl/intl.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class NumberPad extends StatefulWidget {
  final ValueChanged<String> onComplete;
  final bool withdraw;
  final String? actionButtonTitle;

  const NumberPad({Key? key, required this.onComplete, required this.withdraw, required this.actionButtonTitle}) : super(key: key);
  
  @override
  _NumberPadState createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  final NavigationService _navigationService = locator<NavigationService>();
  final currencyFormatter = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 0);
  TextEditingController amountController = new TextEditingController();
  String amount = '';

  void runProcess() {
    amountController.text = '${currencyFormatter.format(int.tryParse(amount))}';
    amountController.selection = TextSelection.fromPosition(TextPosition(offset: amountController.text.length));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
            // margin: EdgeInsets.only(bottom: SizeConfig.yMargin(context, .5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enter Amount',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 16.sp
                  ),
                ),
                PlatformIconButton(
                  onPressed: () => _navigationService.back(),
                  icon: Icon(
                    PlatformIcons(context).clear,
                  )
                )
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.symmetric(vertical: SizeConfig.yMargin(context, 1)),
            // padding: EdgeInsets.symmetric(horizontal: SizeConfig.xMargin(context, .5)),
            width: 200.w,
            // height: SizeConfig.yMargin(context, 5),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.black, width: 2),
            //   borderRadius: BorderRadius.circular(SizeConfig.yMargin(context, 1))
            // ),
            child: CustomTextField(
              controller: amountController,
              showCusor: true,
              center: true,
              readOnly: true,
              autofocus: true,
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            keyPad(
                              context: context,
                              text: '1',
                              func: (text) => setState(() {
                                amount = '$amount$text';
                                runProcess();
                              })
                            ),
                            keyPad(
                              context: context,
                              text: '2', 
                              func: (text) => setState(() {
                                amount = '$amount$text';
                                runProcess();
                              })
                            ),
                            keyPad(
                              context: context,
                              text: '3',
                              func: (text) => setState(() {
                                amount = '$amount$text';
                                runProcess();
                              })
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            keyPad(
                              context: context,
                              text: '4',
                              func: (text) => setState(() {
                                amount = '$amount$text';
                                runProcess();
                              })
                            ),
                            keyPad(
                              context: context,
                              text: '5',
                              func: (text) => setState(() {
                                amount = '$amount$text';
                                runProcess();
                              })
                            ),
                            keyPad(
                              context: context,
                              text: '6',
                              func: (text) => setState(() {
                                amount = '$amount$text';
                                runProcess();
                              })
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            keyPad(
                              context: context,
                              text: '7',
                              func: (text) => setState(() {
                                amount = '$amount$text';
                                runProcess();
                              })
                            ),
                            keyPad(
                              context: context,
                              text: '8',
                              func: (text) => setState(() {
                                amount = '$amount$text';
                                runProcess();
                              })
                            ),
                            keyPad(
                              context: context,
                              text: '9',
                              func: (text) => setState(() {
                                amount = '$amount$text';
                                runProcess();
                              })
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundColor: Colors.transparent,
                            ),
                            keyPad(
                              context: context,
                              text: '0',
                              func: (text) => setState(() {
                                if(amount.length > 0) {
                                  amount = '$amount$text';
                                  runProcess();
                                }
                              })
                            ),
                            amount == '' || amount == '₦' ? SizedBox(
                              width: 60.r
                            ) : InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                setState(() {
                                  if(amount.length>1) {
                                    amount = amount.substring(0, amount.length-1);
                                    runProcess();
                                  } else {
                                    amount = '';
                                    amountController.text = '';
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: 32.r,
                                backgroundColor: BrandColors.light2,
                                child: Center(
                                  child: amount == '' ? SizedBox() : Icon(
                                    Icons.backspace,
                                    color: Colors.black,
                                  )
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _navigationService.back();
                    widget.onComplete(amount);
                  },
                  child: Container(
                    color: widget.withdraw ? Colors.orange : Colors.green,
                    padding: EdgeInsets.only(
                      top: 30.h,
                      bottom: Platform.isIOS ? 40.h : 30.h
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.actionButtonTitle ?? 'Top-Up',
                            style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 20.sp,
                              color: Colors.white
                            ),
                          ),
                          // SizedBox(width: 20.w,),
                          // Icon(
                          //   Icons.arrow_forward,
                          //   color: Colors.white,
                          // )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }

  Widget keyPad({required BuildContext context, required String text, required Function func}) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () => func(text),
      child: CircleAvatar(
        backgroundColor: BrandColors.light2,
        radius: 32.r,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 25.sp,
              // color: BrandColors.primary
            ),
          ),
        )
      ),
    );
  } 
}