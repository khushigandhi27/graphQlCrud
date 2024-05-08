import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomFlushBar {
  static showSuccessOrFail({
    required BuildContext context,
    String title = '',
    String message = '',
    bool isFailed = false,
    Duration? duration,
    FlushbarPosition? flushbarPosition,
  }) {
    return Flushbar(
        titleText: Text(
          title.isEmpty
              ? isFailed
                  ? 'Failed'
                  : 'Success'
              : title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
        ),
        messageText: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
        ),
        shouldIconPulse: false,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        flushbarPosition: flushbarPosition ?? FlushbarPosition.TOP,
        duration: duration ?? const Duration(seconds: 2),
        backgroundColor: isFailed
            ? Colors.red
            : Colors.green,
        icon: isFailed
            ? Icon(
                Icons.warning_amber_outlined,
                size: 8.w,
                color: Colors.white,
              )
            : Icon(
                Icons.check_circle_outline_rounded,
                size: 8.w,
                color: Colors.white,
              ))
      ..show(context);
  }
}
