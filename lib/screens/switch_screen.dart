import 'package:flutter/material.dart';
import 'package:flutter_application_2/common/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../common/app_images.dart';
import '../common/const.dart';
import '../provider/switch_provider.dart';
import '../widgets/sun_and_moon_widget.dart';

class Switcher extends StatelessWidget {
  final double? width;
  final double? height;
  const Switcher({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SwitcherProvider>(context);

    return Center(
      child: AnimatedContainer(
        duration: timeAnimation,
        width: width ?? 369.w,
        height: height ?? 145.w,
        decoration: BoxDecoration(
          color: !provider.isDarkMode
              ? AppColors.backgroundSwitchLight
              : AppColors.backgroundSwitchDark,
          borderRadius: BorderRadius.circular(100.w),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -3.w),
              blurRadius: 4.w,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.25),
            ),
            BoxShadow(
              offset: Offset(0, 4.w),
              blurRadius: 4.w,
              spreadRadius: 0,
              color: Colors.white.withOpacity(0.72),
            ),
            BoxShadow(
              offset: Offset(0, -1.w),
              blurRadius: 12.w,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.25),
            ),
            BoxShadow(
              offset: Offset(1, 5.w),
              blurRadius: 9.w,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.w),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: timeAnimation,
                bottom: !provider.isDarkMode ? 0 : -150.w,
                right: 0,
                child: Image.asset(
                  AppImages.cloudsBacks,
                  width: 377.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
              AnimatedPositioned(
                duration: timeAnimation,
                bottom: !provider.isDarkMode ? 0 : -150.w,
                child: Image.asset(
                  AppImages.clouds,
                  width: 370.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
              AnimatedPositioned(
                duration: timeAnimation,
                left: 43.w,
                top: !provider.isDarkMode ? -150.w : 23.w,
                child: Image.asset(
                  AppImages.stars,
                  width: 142.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
              AnimatedPositioned(
                duration: timeAnimation,
                left: !provider.isDarkMode ? -90.w : 135.w,
                top: -90.w,
                child: SunAndMoonWidget(
                  isDarkMode: !provider.isDarkMode,
                  callBack: provider.switchColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
