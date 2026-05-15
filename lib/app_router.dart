
import 'package:go_router/go_router.dart';
import 'package:varindo_estate_management/screens/main_screen.dart';
import 'package:varindo_estate_management/splash_screen.dart';

class AppRouter {

  static final GoRouter _router = GoRouter(
    initialLocation: "/splash-screen",
    routes: [
      GoRoute(
        path: "/splash-screen",
        name: "splash-screen",
        builder: (context, state) {
          return SplashScreen();
        }
      ),
      GoRoute(
        path: "/main",
        name: "main",
        builder: (context, state) {
          return MainScreen();
        }
      )
    ]
  );

  GoRouter get router => _router;
}