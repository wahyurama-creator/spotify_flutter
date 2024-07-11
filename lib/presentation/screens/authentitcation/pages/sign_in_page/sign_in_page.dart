import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_flutter/common/extensions/context_extension.dart';
import 'package:spotify_flutter/core/configs/assets/app_vector.dart';
import 'package:spotify_flutter/core/configs/themes/app_color.dart';
import 'package:spotify_flutter/presentation/screens/authentitcation/pages/sign_up_page/sign_up_page.dart';
import 'package:spotify_flutter/presentation/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_flutter/presentation/widgets/buttons/basic_app_button.dart';
import 'package:spotify_flutter/presentation/widgets/text_fields/basic_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVector.appLogo,
          width: 40.w,
          height: 40.w,
        ),
        isCenterTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildContent(context),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildRegisterNowText(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContent(BuildContext context) => [
        SizedBox(height: 30.h),
        Text(
          'Sign In',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15.h),
        RichText(
          text: TextSpan(
            text: 'If You Need Any Support',
            style: TextStyle(
              fontSize: 12.sp,
              color: context.isDarkMode ? Colors.white : AppColor.darkGreyColor,
            ),
            children: [
              TextSpan(
                text: ' Click Here',
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w300,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 26.h),
        _emailField(),
        SizedBox(height: 16.h),
        _passwordField(),
        SizedBox(height: 33.h),
        BasicAppButton(
          text: 'Sign In',
          onPressed: () {},
        ),
        SizedBox(height: 40.h),
        _buildDivider(),
        SizedBox(height: 40.h),
        _buildSocialMediaButtons(),
      ];

  Widget _emailField() => BasicTextField(
        controller: _emailController,
        focusNode: _emailFocusNode,
        hintText: 'Email Address',
        keyboardType: TextInputType.emailAddress,
      );

  Widget _passwordField() => BasicTextField(
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        hintText: 'Password',
        keyboardType: TextInputType.visiblePassword,
        isObscureText: true,
      );

  Widget _buildDivider() => Row(
        children: [
          Expanded(
            child: Divider(height: .1.h),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              'Or',
              style: TextStyle(
                fontSize: 12.sp,
                color: context.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Divider(height: .1.h),
          ),
        ],
      );

  Widget _buildSocialMediaButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppVector.icGoogle,
              width: 35.w,
              height: 35.w,
            ),
          ),
          SizedBox(width: 40.w),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppVector.icApple,
              width: 35.w,
              height: 35.w,
            ),
          ),
        ],
      );

  Widget _buildRegisterNowText() => Padding(
        padding: EdgeInsets.only(bottom: 32.h),
        child: RichText(
          text: TextSpan(
            text: 'Not A Member?',
            style: TextStyle(
              fontSize: 13.sp,
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
            children: [
              TextSpan(
                text: ' Register Now',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUpPage(),
                        ),
                      ),
              ),
            ],
          ),
        ),
      );
}