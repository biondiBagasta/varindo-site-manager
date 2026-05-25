
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:varindo_estate_management/cubit/komplain_create_screen_cubit.dart';
import 'package:varindo_estate_management/cubit/update_unit_progress_screen_cubit.dart';
import 'package:varindo_estate_management/screens/auth/sign_in_screen.dart';
import 'package:varindo_estate_management/screens/main/detail_cluster_screen.dart';
import 'package:varindo_estate_management/screens/main/detail_cluster_unit_screen.dart';
import 'package:varindo_estate_management/screens/main/detail_unit_approved_screen.dart';
import 'package:varindo_estate_management/screens/main/komplain_create_screen.dart';
import 'package:varindo_estate_management/screens/main/perumahan_detail_screen.dart';
import 'package:varindo_estate_management/screens/main/update_unit_progress_screen.dart';
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
        path: "/sign-in",
        name: "sign-in",
        builder: (context, state) {
          return SignInScreen();
        }
      ),
      GoRoute(
        path: "/main",
        name: "main",
        builder: (context, state) {
          return MainScreen();
        },
        routes: [
          GoRoute(
            path: "detail-cluster",
            name: "detail-cluster",
            builder: (context, state) {
              final extra = state.extra as Map<dynamic, dynamic>;
              final clusterName = extra["clusterName"] as String;
              final blokName = extra["blokName"] as String;

              return DetailClusterScreen(clusterName: clusterName, blokName: blokName);
            }
          ),
          GoRoute(
            path: "detail-cluster-unit",
            name: "detail-cluster-unit",
            builder: (context, state) {
              final extra = state.extra as Map<dynamic, dynamic>;
              final unitName = extra["unitName"] as String;
              return DetailClusterUnitScreen(unitName: unitName);
            }
          ),
          GoRoute(
            path: "detail-unit-approved",
            name: "detail-unit-approved",
            builder: (context, state) {
              final extra = state.extra as Map<dynamic, dynamic>;
              final unitName = extra["unitName"] as String;
              return DetailUnitApprovedScreen(unitName: unitName);
            }
          ),
          GoRoute(
            path: "perumahan-detail",
            name: "perumahan-detail",
            builder: (context, state) {
              final extra = state.extra as Map<dynamic, dynamic>;
              final perumahanName = extra["perumahanName"] as String;
              return PerumahanDetailScreen(perumahanName: perumahanName);
            }
          ),
          GoRoute(
            path: "update-unit-progress",
            name: "update-unit-progress",
            builder: (context, state) {
              final extra = state.extra as Map<dynamic, dynamic>;
              final progressName = extra["progressName"] as String;
              return BlocProvider(
                create: (_) => UpdateUnitProgressScreenCubit(),
                child: UpdateUnitProgressScreen(progressName: progressName),
              );
            }
          ),
          GoRoute(
            path: "komplain-create",
            name: "komplain-create",
            builder: (context, state) {
              return BlocProvider(
                create: (_) => KomplainCreateScreenCubit(),
                child: KomplainCreateScreen(),
              );
            }
          ),
        ]
      )
    ]
  );

  GoRouter get router => _router;
}