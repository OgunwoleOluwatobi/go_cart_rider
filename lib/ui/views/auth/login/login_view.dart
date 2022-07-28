import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/ui/views/auth/login/login_viewmodel.dart';
import 'package:go_cart_rider/ui/widgets/back_wrapper.dart';

class LoginView extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const LoginView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode node = FocusScope.of(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => BackWrapper(
        title: '',
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 33.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back!',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        'Please enter your information below in order to login to your account',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      CustomTextField(
                        label: 'Email Address',
                        prefixImage: 'mail'.svg,
                        hintText: 'johndoe@gmail.com',
                        type: TextFieldType.email,
                        inputType: TextInputType.emailAddress,
                        onChanged: model.setEmail
                      ),
                      SizedBox(height: 40.h,),
                      CustomTextField(
                        label: 'Password',
                        prefixImage: 'lock'.svg,
                        hintText: '********',
                        type: TextFieldType.password,
                        obscure: model.obscure,
                        suffixFunc: () => model.setObscure(),
                        onChanged: model.setPassword
                      ),
                      SizedBox(height: 50.h,),
                      CustomButton(
                        title: 'Login',
                        textSize: 12.sp,
                        onTap: () {
                          node.unfocus();
                          if(formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            model.login();
                          }
                        }
                      )
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () => model.navigateToRegister(),
                child: Text(
                  'Don’t have an account? SignUp',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h,)
          ],
        ),
      ),
    );
  }
}