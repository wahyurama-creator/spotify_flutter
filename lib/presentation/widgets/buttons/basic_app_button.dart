import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAppButton extends StatelessWidget {
  final String text;
  final double height;
  final Function() onPressed;

  const BasicAppButton({
    super.key,
    required this.text,
    this.height = 70.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height.h),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18.sp, color: Colors.white),
      ),
    );
  }
}