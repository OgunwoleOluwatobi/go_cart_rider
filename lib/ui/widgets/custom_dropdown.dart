import 'package:go_cart_rider/core/utils/exports.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?> onChanged;
  final bool enabled, loading;
  final TextStyle? style;
  final String? helperText;

  const CustomDropdown({Key? key, this.label, this.hint, required this.value, required this.items, required this.onChanged, this.style, this.helperText, this.loading = false, this.enabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label ==null ? SizedBox() : Container(
          margin: EdgeInsets.only(bottom: 5.h, left: 8.w),
          child: Text(
            label!,
            style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: BrandColors.textDark//BrandColors.secondary
            ),
          ),
        ),
        loading ? DropDownLoader() : AbsorbPointer(
          absorbing: !enabled,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
            decoration: BoxDecoration(
              color: BrandColors.fieldGrey.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10.r)
            ),
            child: DropdownButton(
              style: style ?? Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 17.sp,
                color: BrandColors.textDark3
              ),
              hint: hint == null ? SizedBox() : Text(hint!),
              // focusColor: Color(0xFFB9B9B9).withOpacity(0.12),
              dropdownColor: Colors.white,
              elevation: 1,
              underline: SizedBox(
                height: .08.h,
              ),
              isDense: true,
              isExpanded: true,
              icon: enabled ? Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF718096).withOpacity(0.5),
                size: 24.w,
              ) : SizedBox(),
              value: value,
              items: items,
              onChanged: onChanged
            ),
          ),
        ),
        SizedBox(height: 6.h,),
        helperText == null ? SizedBox() : Text(
          helperText!,
          style: Theme.of(context).textTheme.headline3!.copyWith(
            fontSize: 12.sp,
            color: BrandColors.grey9c,
          ),
        )
      ],
    );
  }
}

class DropDownLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14.h),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
      decoration: BoxDecoration(
        color: BrandColors.fieldGrey.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Row(
        children: [
          Container(
            width: 20.h,
            height: 20.h,
            child: CircularProgressIndicator(strokeWidth: 2,)
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Text(
              'Loading',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF718096).withOpacity(0.5),
            size: 26.w,
          )
        ],
      )
    );
  }
}