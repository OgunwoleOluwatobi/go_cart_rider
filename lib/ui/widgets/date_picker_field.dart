import 'package:flutter/cupertino.dart';
import 'package:go_cart_rider/core/utils/date_format_utils.dart';
import 'package:go_cart_rider/core/utils/exports.dart';

class DatePickerfield extends StatefulWidget {
  final String? label;
  final String? value;
  final String? placeholder;
  final DateTime? stopDate;
  final DateTime? startDate;
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateSelected;
  final bool enabled;

  DatePickerfield({
    Key? key,
    this.label,
    this.value,
    this.stopDate,
    this.startDate,
    this.placeholder,
    this.initialDate,
    required this.onDateSelected,
    this.enabled = true
  }) : super(key: key);

  @override
  _DatePickerfieldState createState() => _DatePickerfieldState();
}

class _DatePickerfieldState extends State<DatePickerfield> {
  String date = '';
  late DateTime dateTime;

  @override
  void initState() { 
    super.initState();
    print(widget.startDate?.year);
    print(widget.initialDate?.year);
    if(widget.value != null) {
      date = widget.value!;
    }
    if(widget.initialDate != null) {
      dateTime = widget.initialDate!;
    } else {
      dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    }
  }

  Future showPicker(BuildContext context) async{
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: widget.startDate ?? DateTime(1800),
          lastDate: widget.stopDate ?? DateTime(2050),
        ).then((value)  {
          if(value != null) {
            setState(() {
              dateTime = value;
              date = DateFormatUtil.yyyymmdd.format(dateTime);
              widget.onDateSelected(dateTime);
            });
          }
        });
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return showModalBottomSheet(
          context: context,
          builder: (BuildContext builder) {
            return Container(
              height: 350.h,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {
                          setState(() {
                            date = DateFormatUtil.yyyymmdd.format(value);
                            dateTime = value;
                            
                          });
                        },
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        initialDateTime: dateTime,
                        minimumYear: widget.startDate?.year ?? DateTime(1800).year,
                        maximumYear: widget.stopDate?.year ?? DateTime(2050).year,
                        minimumDate: widget.startDate ?? DateTime(1800),
                        maximumDate: widget.stopDate ?? DateTime(2050),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    child: Text(
                      'OK'
                    ),
                    onPressed: () {
                      setState(() {
                        date = DateFormatUtil.yyyymmdd.format(dateTime);
                        widget.onDateSelected(dateTime);
                      });
                      Navigator.of(context).pop();
                    }
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            );
          }
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label ==null ? SizedBox() : Container(
          margin: EdgeInsets.only(bottom: 5.h, left: 8.w),
          child: Text(
            widget.label!,
            style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: BrandColors.textDark
            ),
          ),
        ),
        Container(
          // margin: EdgeInsets.symmetric(vertical: 14.h,),
          child: InkWell(
            onTap: widget.enabled ? () async => await showPicker(context) : (){},
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 22.w),
              decoration: BoxDecoration(
                color: BrandColors.fieldGrey.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10.r)
                // border: Border(
                //   bottom: BorderSide(
                //     color: Colors.black.withOpacity(.08),
                //     width: 1.3
                //   ),
                // )
              ),
              child: Text(
                date.isNotEmpty ? date : '${widget.placeholder}',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontSize: 16.sp,
                  color: date.isNotEmpty ? BrandColors.textDark3 : BrandColors.textDark.withOpacity(.5),
                  // fontWeight: date.isNotEmpty ? FontWeight.w500 : FontWeight.w300
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
