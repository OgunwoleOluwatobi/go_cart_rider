import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/ui/views/auth/verify_mail/verify_mail_viewmodel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyMailView extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const VerifyMailView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode node = FocusScope.of(context);
    return ViewModelBuilder<VerifyMailViewModel>.reactive(
      viewModelBuilder: () => VerifyMailViewModel(),
      builder: (context, model, child) => BackWrapper(
        title: '',
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 33.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verify Email',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      'Please enter the four digits sent to ${model.user?.email}',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Form(
                      key: formKey,
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        backgroundColor: Colors.transparent,
                        appContext: context,
                        useHapticFeedback: true,
                        validator: (value) {
                          if(value == null) return 'Invalid value';
                          if(value.isEmpty) {
                            return 'Enter value';
                          }
                          return null;
                        },
                        // errorAnimationController: model.errorController,
                        length: 5,
                        enableActiveFill: true,
                        enablePinAutofill: true,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.scale,
                        textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 22.sp
                        ),
                        pinTheme: Utils.roundedBoxPinField,
                        onChanged: model.setToken
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Center(
                      child: GestureDetector(
                        onTap: () => model.resendToken(),
                        child: Container(
                          padding: EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: BrandColors.primary
                            ),
                            borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Resend Code',
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 14.sp,
                                  color: BrandColors.primary
                                ),
                              ),
                              SizedBox(width: 4.w,),
                              Icon(
                                Icons.refresh,
                                color: BrandColors.primary,
                                size: 16.h,
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 80.h,),
                    CustomButton(
                      title: 'Proceed',
                      textSize: 12.sp,
                      onTap: () {
                        node.unfocus();
                        if(formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          model.verify();
                        }
                      }
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}