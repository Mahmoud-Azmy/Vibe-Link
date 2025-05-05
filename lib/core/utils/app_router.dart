import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/di/dependency_injection.dart';
import 'package:vibe_link/features/auth/data/repos/auth_repo.dart';
import 'package:vibe_link/features/auth/presentation/controllers/login/login_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_cubit.dart';
import 'package:vibe_link/features/auth/presentation/views/login_view.dart';
import 'package:vibe_link/features/auth/presentation/views/reset_password_screen.dart';
import 'package:vibe_link/features/auth/presentation/views/set_new_password_screen.dart';
import 'package:vibe_link/features/auth/presentation/views/sign_up_view.dart';
import 'package:vibe_link/features/auth/presentation/views/verification_view.dart';
import 'package:vibe_link/features/home/home_view.dart';
import 'package:vibe_link/features/onBoarding/on_boarding.dart';

abstract class AppRouter {
  static const String onBoarding = '/';
  static const String registerView = '/register';
  static const String loginView = '/login';
  static const String homeView = '/home';
  static const String verification = '/verification';
  static const String resetPassword = '/resetPassword';
  static const String setNewPassword = '/setNewPassword';

  static GoRouter router(String initialRoute) {
    return GoRouter(
      initialLocation: initialRoute, // Set the initial route dynamically
      routes: [
        GoRoute(
          path: onBoarding,
          builder: (context, state) => const OnBoarding(),
        ),
        GoRoute(path: homeView, builder: (context, state) => const HomeView()),
        GoRoute(
          path: loginView,
          builder:
              (context, state) => BlocProvider(
                create: (context) => LoginCubit(sl<AuthRepo>()),
                child: const LoginView(),
              ),
        ),
        GoRoute(
          path: registerView,
          builder:
              (context, state) => BlocProvider(
                create: (context) => SignupCubit(sl<AuthRepo>()),
                child: const SignUpView(),
              ),
        ),
        GoRoute(
          path: verification,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final userId = extra?['userId'] ?? '';
            final email = extra?['email'] ?? '';
            final name = extra?['name'] ?? '';
            return VerificationScreen(userId: userId, email: email, name: name);
          },
        ),
        GoRoute(
          path: resetPassword,
          builder: (context, state) => const ResetPasswordScreen(),
        ),
        GoRoute(
          path: setNewPassword,
          builder: (context, state) => const SetNewPasswordScreen(),
        ),
      ],
    );
  }
}
