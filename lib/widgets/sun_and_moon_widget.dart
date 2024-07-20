import 'package:flutter/material.dart';
import 'package:flutter_application_2/common/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SunAndMoonWidget extends StatelessWidget {
  final bool isDarkMode;
  final Function? callBack;
  const SunAndMoonWidget({super.key, this.isDarkMode = false, this.callBack});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 328.w,
      width: 328.w,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(AppImages.ellipse_1, width: 184.27.w)),
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.ellipse_2,
                width: 259.82.w,
                fit: BoxFit.fitWidth,
              )),
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.ellipse_3,
                width: 328.w,
                fit: BoxFit.fitWidth,
              )),
          Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => callBack?.call(),
                child: Stack(
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: !isDarkMode ? 0.0 : 1.0,
                      child: Image.asset(
                        AppImages.sunimg,
                        height: 124.w,
                        width: 124.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: isDarkMode ? 0.0 : 1.0,
                      child: Image.asset(
                        AppImages.moon,
                        height: 124.w,
                        width: 124.w,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
