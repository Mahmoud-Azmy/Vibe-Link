import 'package:go_router/go_router.dart';
import 'package:vibe_link/features/auth/presentation/views/login_view.dart';
import 'package:vibe_link/features/auth/presentation/views/sign_up_view.dart';
import 'package:vibe_link/features/onBoarding/on_boarding.dart';

abstract class AppRouter {
  static const String onBoarding = '/';
  static const String registerView = '/register';
  static const String loginView = '/login';
  static const String homeView = '/home';

  static GoRouter router(String initialRoute) {
    return GoRouter(
      initialLocation: initialRoute, // Set the initial route dynamically
      routes: [
        GoRoute(
          path: onBoarding,
          builder: (context, state) => const OnBoarding(),
        ),
        GoRoute(
          path: loginView,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: registerView,
          builder: (context, state) => const SignUpView(),
        ),
      ],
    );
  }
}
