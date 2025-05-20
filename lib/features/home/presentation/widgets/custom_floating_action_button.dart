import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/post_cubit.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: AppColors.buttonsColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: RawMaterialButton(
        shape: CircleBorder(),
        elevation: 0,
        onPressed: () {
          GoRouter.of(context).push(AppRouter.createPostView).then((result) {
            if (result == true) {
              context.read<PostCubit>().fetchPosts();
            }
          });
        },
        child: SvgPicture.asset(AppAssets.plus, height: 24.h, width: 24.w),
      ),
    );
  }
}
