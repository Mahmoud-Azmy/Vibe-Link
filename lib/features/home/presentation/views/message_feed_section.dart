import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/features/home/presentation/widgets/users_message_list_view_item.dart';
import 'package:vibe_link/generated/l10n.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppAssets.arrowLeft, height: 24, width: 24),
                Text(
                  S.of(context).message,
                  style: AppTextStyles.font18Bold.copyWith(color: Colors.black),
                ),
                SvgPicture.asset(AppAssets.edit, height: 24, width: 24),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: UsersMessageListViewItem(),
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.chatView);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
