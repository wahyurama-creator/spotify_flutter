import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_flutter/common/extensions/context_extension.dart';
import 'package:spotify_flutter/core/configs/assets/app_image.dart';
import 'package:spotify_flutter/core/configs/assets/app_vector.dart';
import 'package:spotify_flutter/presentation/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_flutter/presentation/widgets/buttons/basic_app_button.dart';

class SignUpOrSignInPage extends StatelessWidget {
  const SignUpOrSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Stack(
        children: [
          _buildTopPattern(),
          _buildBottomPattern(),
          _buildActorImage(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildTopPattern() => Align(
        alignment: Alignment.topRight,
        child: SvgPicture.asset(AppVector.icUnionTopPattern),
      );

  Widget _buildBottomPattern() => Align(
        alignment: Alignment.bottomRight,
        child: SvgPicture.asset(AppVector.icUnionBottomPattern),
      );

  Widget _buildActorImage() => Align(
        alignment: Alignment.bottomLeft,
        child: Image.asset(AppImage.imgSignUpOrSignInBg),
      );

  Widget _buildContent(BuildContext context) => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 46.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppVector.appLogo),
            SizedBox(height: 55.h),
            Text(
              'Enjoy Listening to Music',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 21.h),
            Text(
              'Spotify is a proprietary Swedish audio streaming and media '
              'services provider',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: BasicAppButton(
                    text: 'Register',
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: context.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}