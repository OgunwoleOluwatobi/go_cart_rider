import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/ui/views/auth/register/register_viewmodel.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class RegisterView extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const RegisterView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode node = FocusScope.of(context);
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, model, child) =>  BackWrapper(
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
                        'Create an account',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        'Please provide us with information in order to create an account',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      CustomTextField(
                        label: 'Firstname',
                        prefixImage: 'name'.svg,
                        hintText: 'Enter firstname',
                        onChanged: model.setFirstname
                      ),
                      SizedBox(height: 30.h,),
                      CustomTextField(
                        label: 'Lastname',
                        prefixImage: 'name'.svg,
                        hintText: 'Enter lastname',
                        onChanged: model.setLastname
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
                      SizedBox(height: 30.h,),
                      GooglePlaceAutoCompleteTextField(
                        textEditingController: TextEditingController(),
                        googleAPIKey: env['MAP_KEY']!,
                        countries: ['ng'],
                        inputDecoration: InputDecoration(),
                        isLatLngRequired:true,
                        getPlaceDetailWithLatLng: (Prediction prediction) {
                          model.setLocation(prediction.lat??'', prediction.lng??'');
                          print("placeDetails" + prediction.lng.toString());
                        },
                        itmClick: (Prediction prediction) {
                          model.setAddress(prediction.description ?? '');
                        }
                      ),
                      SizedBox(height: 30.h,),
                      CustomTextField(
                        label: 'Plate Number',
                        prefixImage: 'name'.svg,
                        hintText: 'Enter motorcycle plate number',
                        onChanged: model.setPlate
                      ),
                      SizedBox(height: 30.h,),
                      CustomTextField(
                        label: 'Password',
                        prefixImage: 'lock'.svg,
                        hintText: '********',
                        type: TextFieldType.setPassword,
                        obscure: model.obscure1,
                        suffixFunc: () => model.setObscure(1),
                        onChanged: model.setPassword
                      ),
                      SizedBox(height: 30.h,),
                      CustomTextField(
                        label: 'Confirm Password',
                        prefixImage: 'lock'.svg,
                        hintText: '********',
                        type: TextFieldType.password,
                        obscure: model.obscure2,
                        suffixFunc: () => model.setObscure(2),
                        onChanged: model.setCPassword
                      ),
                      SizedBox(height: 30.h,),
                      CustomTextField(
                        label: 'Referral Code (optional)',
                        prefixImage: 'lock'.svg,
                        hintText: '********',
                        validate: false,
                      ),
                      SizedBox(height: 40.h,),
                      CustomButton(
                        title: 'Create account',
                        textSize: 12.sp,
                        onTap: () {
                          node.unfocus();
                          if(formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            if(model.password == model.cPassword) {
                              model.register();
                            } else {
                              flusher('Passwords do not match', type: FlusherColorType.error);
                            }
                          }
                        }
                      ),
                      SizedBox(height: 50.h,),
                    ],
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