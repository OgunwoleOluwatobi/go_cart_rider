import 'package:go_cart_rider/core/utils/exports.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextStyle? style;
  final String? hintText;
  final String? prefixImage;
  final String? suffixImage;
  final Icon? suffixIcon;
  final Function? suffixIconFunc;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final bool? obscure;
  final TextInputAction? action;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;
  final VoidCallback? suffixFunc;
  final String? errorText;
  final bool? enabled;
  final String? helperText;
  final TextStyle? helperStyle;
  final int? maxLength;
  final bool? center;
  final bool? showCusor;
  final bool? readOnly;
  final bool? autofocus;
  final Function? onSubmit;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextFieldType? type;
  final bool? validate;
  final bool? symbol;
  final bool rounded;
  final bool filled;
  final double? radius;
  final Function? validator;
  // final UserBloc _userBloc = locator<UserBloc>();

  CustomTextField({Key? key, this.label, this.style, this.hintText, this.prefixImage, this.suffixImage, this.suffixIcon, this.suffixIconFunc, this.minLines, this.maxLines, this.controller, this.obscure, this.action, this.inputType, this.onChanged, this.suffixFunc, this.errorText, this.enabled = true, this.helperText, this.helperStyle, this.maxLength, this.onSubmit, this.focusNode, this.center = false, this.showCusor = true, this.readOnly = false, this.autofocus = false, this.textInputAction, this.inputFormatters, this.type = TextFieldType.others, this.symbol = false, this.validate = true, this.rounded = true, this.radius, this.validator, this.filled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        label ==null ? SizedBox() : Container(
          margin: EdgeInsets.only(bottom: 5.h, left: 0),
          child: Text(
            label!,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              color: BrandColors.dark5A
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  validator: validator == null ? type == TextFieldType.bvn ? (val) {
                    if(val!.isEmpty) {
                      return 'Field cannot be empty';
                    } else if (val.trim().isEmpty) {
                      return "Field cannot be empty";
                    } else if(val.length < 11) {
                      return 'Invalid Entry';
                    } else if(int.tryParse(val) == null) {
                      return 'Invalid entry';
                    }
                    return null;
                  } : type == TextFieldType.accountNo ? (val) {
                    if(val!.isEmpty) {
                      return 'Field cannot be empty';
                    } else if (val.trim().isEmpty) {
                      return "Field cannot be empty";
                    } else if(val.length < 10) {
                      return 'Invalid Entry';
                    } else if(int.tryParse(val) == null) {
                      return 'Invalid entry';
                    }
                    return null;
                  } : type == TextFieldType.phone ? (val) {
                    if(val!.isEmpty || val.trim().isEmpty){
                      return 'Field must not be empty';
                    } else if(val.length<11) {
                      return 'Invalid entry';
                    } else if(int.tryParse(val.replaceAll('+', '').replaceAll(' ', '')) == null) {
                      return 'Invalid entry';
                    }
                    return null;
                  } : (value) {
                    if(validate!) {
                      if (value!.isEmpty) {
                        return "Field cannot be empty";
                      } else if (value.trim().isEmpty) {
                        return "Field cannot be empty";
                      } else if(type == TextFieldType.amount) {
                        if(double.tryParse(value.replaceAll(',', '')) == null) {
                          return 'Enter a valid amount';
                        } else if(double.tryParse(value.replaceAll(',', ''))! <= 0) {
                          return 'Enter a valid amount';
                        }
                      } else if(type == TextFieldType.email) {
                        bool isValidEmail = RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value) && (checkEndSpace(value)) && RegExp(r'[A-Za-z0-9]').hasMatch(value[0]);
                        
                        return isValidEmail ? null : "Please provide a valid email address";
                      } else if(type == TextFieldType.setPassword) {
                        bool isValidPassword = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,15}$')
                        // bool isValidPassword = RegExp(r"^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[^\da-zA-Z]).{8,15}$")
                        .hasMatch(value);
                        // if(!isValidPassword) flusher('Password must contain at least one special character,one number, one lower case letter, one upper case letter and between 8 and 15 characters long', color: Colors.red);

                        return isValidPassword ? null : "Password must contain at least one special character,one number, one lower case letter, one upper case letter and between 8 and 15 characters long";
                      }
                    }

                    return null;
                  } : (val) => validator!(val),
                  inputFormatters: getFormertter(),
                  focusNode: focusNode,
                  autofocus: autofocus!,
                  showCursor: showCusor,
                  readOnly: readOnly!,
                  enableInteractiveSelection: true,
                  enabled: enabled == null ? true : enabled,
                  controller: controller,
                  maxLines: maxLines == null ? 1 : maxLines,
                  minLines: minLines,
                  obscureText: obscure == null ? false : obscure!,
                  style: style ?? TextStyle(
                    fontSize: rounded ? 17.sp : 15.sp,
                    fontFamily: symbol! ? 'Roboto' : 'OpenSans',
                    color: BrandColors.dark5A
                  ),
                  textAlign: center! ? TextAlign.center : TextAlign.start,
                  textInputAction: textInputAction == null ? TextInputAction.done : textInputAction,
                  onEditingComplete: onSubmit ==null ? null : () => onSubmit!(),
                  keyboardType: inputType == null ? TextInputType.text : inputType,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: onChanged,
                  maxLength: maxLength,
                  decoration: new InputDecoration(
                    fillColor: Color(0xFFC4C4C4).withOpacity(.3),
                    filled: filled,
                    hintText: hintText ?? '',
                    hintStyle: TextStyle(
                      fontSize: 12.sp,
                      color: BrandColors.dark5A.withOpacity(.5)
                    ),
                    helperText: helperText,
                    helperStyle: helperStyle,
                    border: OutlineInputBorder(
                      borderSide: filled ? BorderSide.none : BorderSide(
                        color: Color(0xFF5A5A5A).withOpacity(.5)
                      ),
                      borderRadius: BorderRadius.circular(filled ? 10.r : rounded ? radius ?? 16.r : 16.r)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: filled ? BorderSide.none : BorderSide(
                        color: Color(0xFF5A5A5A).withOpacity(.5)
                      ),
                      borderRadius: BorderRadius.circular(filled ? 10.r : rounded ? radius ?? 16.r : 16.r)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: filled ? BorderSide.none : BorderSide(
                        color: Color(0xFF5A5A5A).withOpacity(.5)
                      ),
                      borderRadius: BorderRadius.circular(filled ? 10.r : rounded ? radius ?? 16.r : 16.r)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: filled ? BorderSide.none : BorderSide(
                        color: Colors.red.withOpacity(.5)
                      ),
                      borderRadius: BorderRadius.circular(filled ? 10.r : rounded ? radius ?? 16.r : 16.r)
                    ),
                    errorText: errorText,
                    contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
                    prefixIconConstraints: BoxConstraints(
                      minHeight: 40.h,
                      minWidth: 60.w
                    ),
                    prefixIcon: prefixImage == null ? null :Container(
                      // margin: EdgeInsets.only(right: 10.w),
                      child: Center(
                        widthFactor: 0.2,
                        child: SvgPicture.asset(
                          prefixImage!
                        ),
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: this.type == TextFieldType.password || this.type == TextFieldType.setPassword ? 40.h : 0,
                      minWidth: this.type == TextFieldType.password || this.type == TextFieldType.setPassword ? 60.w : 0
                    ),
                    suffixIcon: setPasswordIcon(obscuredText: this.obscure, obscurePassword: this.suffixFunc),
                    
                  ),
                ),
              ),
              suffixImage == null ? SizedBox() : Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: InkWell(
                    borderRadius: BorderRadius.circular(5.r),
                    onTap: () => suffixFunc!(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Color(0xFFB9B9B9).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(5.r)
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            suffixImage!,
                            // color: BrandColors.primary,
                            width: 6.w,
                          ),
                        ],
                      ),
                    ),
                  ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget? setPasswordIcon({required bool? obscuredText, required VoidCallback? obscurePassword}) {
    if (this.type == TextFieldType.password || this.type == TextFieldType.setPassword) {
      return IconButton(
        padding: EdgeInsets.all(0.0),
        icon: obscuredText == null ? Icon(
          Icons.error_outline_sharp,
          color: Colors.red,
        ) : obscuredText ? Icon(Icons.visibility_off, color: BrandColors.primary,) : 
        Icon(Icons.visibility, color: BrandColors.primary,),
        onPressed: obscurePassword,
        iconSize: 20.0,
      );
    } else {
      return null;
    }
  }

  bool checkEndSpace(String val) {
    if(val.split(' ').length > 1) {
      if(val.split(' ')[1].trim().isEmpty) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  List<TextInputFormatter>? getFormertter() {
      if(type == TextFieldType.amount) {
        return [
          FilteringTextInputFormatter.digitsOnly,
          ThousandsFormatter(),
          // LengthLimitingTextInputFormatter(7),
        ];
      } else if(type == TextFieldType.bvn) {
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(11)
        ];
      }  else if(type == TextFieldType.accountNo) {
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10)
        ];
      } else if(type == TextFieldType.phone) {
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(14)
        ];
      } else if(type == TextFieldType.name) {
        return [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z-]"))];
      }
      return inputFormatters;
    }
}