import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibe_link/core/di/dependency_injection.dart';
import 'package:vibe_link/core/helper/shared_pref_helper.dart';
import 'package:vibe_link/core/network/push_notifications_service.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/firebase_options.dart';
import 'package:vibe_link/vibe_link.dart';

bool isUserLoggedIn = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await getItInit();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  await checkIfUserLoggedIn();
  await PushNotificationsService.init();
  runApp(const VibeLink());
}

checkIfUserLoggedIn() async {
  String? token = await SharedPrefHelper.getSecuredString(AppStrings.userId);
  if (token == null || token.isEmpty) {
    isUserLoggedIn = false;
  } else {
    isUserLoggedIn = true;
  }
}
