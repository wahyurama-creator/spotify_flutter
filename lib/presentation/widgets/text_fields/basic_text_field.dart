import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_flutter/common/extensions/context_extension.dart';
import 'package:spotify_flutter/core/configs/themes/app_color.dart';

class BasicTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isObscureText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  const BasicTextField({
    super.key,
    this.controller,
    this.hintText,
    this.isObscureText = false,
    this.keyboardType,
    this.focusNode,
  });

  @override
  State<BasicTextField> createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      onTapOutside: (event) => widget.focusNode?.unfocus(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.all(23.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(
            width: .5.w,
            color: context.isDarkMode ? Colors.white : AppColor.darkGreyColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(
            width: .5.w,
            color: context.isDarkMode ? Colors.white : AppColor.darkGreyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(
            width: .5.w,
            color: AppColor.primaryColor,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 14.sp, color: AppColor.greyColor),
        suffixIcon: widget.isObscureText == true
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: context.isDarkMode
                      ? Colors.white
                      : AppColor.darkGreyColor,
                ),
                onPressed: () => setState(() => _isObscured = !_isObscured),
              )
            : null,
      ),
      obscureText: widget.isObscureText == true ? _isObscured : false,
    );
  }
}