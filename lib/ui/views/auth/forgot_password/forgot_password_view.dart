import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/ui/views/auth/forgot_password/forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FocusNode node = FocusScope.of(context);
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                BrandColors.primary,
                BrandColors.primary
              ]
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: Utils.statusBarPadding),
            child: Column(
              children: [
                Container(
                  height: 250.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 20.h,),
                      Image.asset(
                        'white_and_yellow_logo'.png,
                        height: 100.h,
                      ),
                      SizedBox(height: 20.h,),
                      // SvgPicture.asset(
                      //   'auth'.svg,
                      //   width: 120.w,
                      // )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60.r)
                      )
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h,),
                          Text(
                            'Forgot Password',
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 34.sp,
                              color: BrandColors.primary,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30.h,),
                                      CustomTextField(
                                        // prefixImage: 'email'.svg,
                                        hintText: 'Email',
                                        type: TextFieldType.email,
                                        inputType: TextInputType.emailAddress,
                                        onChanged: model.setEmail,
                                        onSubmit: () => node.nextFocus(),
                                      ),
                                      SizedBox(height: 40.h,),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 20.h),
                                        child: Column(
                                          children: [
                                            CustomButton(
                                              title: 'Proceed',
                                              onTap: () {
                                                node.unfocus();
                                                if(formKey.currentState!.validate()) {
                                                  formKey.currentState!.save();
                                                  model.reset();
                                                }
                                              }
                                            ),
                                            SizedBox(height: 20.h,),
                                            GestureDetector(
                                              onTap: () => Navigator.pop(context),
                                              child: Text(
                                                'Back',
                                                style: Theme.of(context).textTheme.headline3!.copyWith(
                                                  fontSize: 14.sp,
                                                  color: BrandColors.secondary
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20.h,),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}