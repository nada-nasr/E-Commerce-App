import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  Function onButtonClick;
  String text;
  Color backgroundColor;
  TextStyle textStyle;

  CustomElevatedButton({super.key,
    required this.onButtonClick,
    required this.text,
    required this.textStyle,
    required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.r))),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Text(text, style: textStyle),
      ),
      onPressed: () {
        onButtonClick();
      },
    );
  }
}
