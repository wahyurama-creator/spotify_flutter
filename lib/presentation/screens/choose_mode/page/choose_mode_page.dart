import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_flutter/core/configs/assets/app_image.dart';
import 'package:spotify_flutter/core/configs/assets/app_vector.dart';
import 'package:spotify_flutter/core/configs/themes/app_color.dart';
import 'package:spotify_flutter/presentation/screens/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify_flutter/presentation/widgets/buttons/basic_app_button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

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
            image: AssetImage(AppImage.imgChooseModeBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: (kToolbarHeight + 4).w,
            horizontal: 46.w,
          ),
          child: Column(
            children: [
              SvgPicture.asset(AppVector.appLogo),
              const Spacer(),
              Text(
                'Choose Mode',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 21.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () =>
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light),
                    child: BlocBuilder<ThemeCubit, ThemeMode>(
                      builder: (context, state) {
                        return Container(
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            color: state == ThemeMode.light
                                ? AppColor.greyColor.withOpacity(0.5)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(14.w),
                          ),
                          child: Column(
                            children: [
                              ClipOval(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10.w,
                                    sigmaY: 10.h,
                                  ),
                                  child: Container(
                                    width: 80.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color(0xFF30393C).withOpacity(
                                        0.5,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppVector.icSun,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 17.h),
                              Text(
                                'Light Mode',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp,
                                  color: state == ThemeMode.dark
                                      ? Colors.white
                                      : AppColor.greyColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 25.w),
                  GestureDetector(
                    onTap: () =>
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark),
                    child: BlocBuilder<ThemeCubit, ThemeMode>(
                      builder: (context, state) {
                        return Container(
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            color: state == ThemeMode.dark
                                ? AppColor.greyColor.withOpacity(0.5)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(14.w),
                          ),
                          child: Column(
                            children: [
                              ClipOval(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 10.w, sigmaY: 10.h),
                                  child: Container(
                                    width: 80.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF30393C)
                                          .withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppVector.icMoon,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 17.h),
                              Text(
                                'Dark Mode',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp,
                                  color: state == ThemeMode.dark
                                      ? Colors.white
                                      : AppColor.greyColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              BasicAppButton(
                text: 'Continue',
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}