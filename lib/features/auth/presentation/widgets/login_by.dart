import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibe_link/core/utils/app_assets.dart';

class LoginBy extends StatelessWidget {
  const LoginBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            backgroundColor: Colors.grey[200],
          ),
          child: SvgPicture.asset(AppAssets.google, width: 24.w, height: 24.h),
        ),
        SizedBox(width: 20.w),
        // Facebook Button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(10.r),
            backgroundColor: Colors.grey[200],
          ),
          child: SvgPicture.asset(
            AppAssets.facebook,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
