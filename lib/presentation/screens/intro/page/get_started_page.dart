import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_flutter/core/configs/assets/app_image.dart';
import 'package:spotify_flutter/core/configs/assets/app_vector.dart';
import 'package:spotify_flutter/core/configs/themes/app_color.dart';
import 'package:spotify_flutter/presentation/screens/choose_mode/page/choose_mode_page.dart';
import 'package:spotify_flutter/presentation/widgets/buttons/basic_app_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(context),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.imgGetStartedBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: (kToolbarHeight + 4).w, horizontal: 46.w),
          child: Column(
            children: [
              SvgPicture.asset(AppVector.appLogo),
              const Spacer(),
              Text(
                'Enjoy Listening to Music',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 21.h),
              Text(
                'Experience unparalleled music enjoyment with Spotify. '
                'Discover your favorite songs, create personal playlists, '
                'and enjoy various genres of music you love.',
                style: TextStyle(
                  color: AppColor.greyColor,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 36.h),
              BasicAppButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChooseModePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
}