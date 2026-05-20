
import 'package:go_router/go_router.dart';
import 'package:varindo_estate_management/screens/auth/phone_number_validation_screen.dart';
import 'package:varindo_estate_management/screens/auth/select_property_list_screen.dart';
import 'package:varindo_estate_management/screens/auth/sign_in_screen.dart';
import 'package:varindo_estate_management/screens/main_screen.dart';
import 'package:varindo_estate_management/screens/varindo/darurat_screen.dart';
import 'package:varindo_estate_management/screens/varindo/event_warga_screen.dart';
import 'package:varindo_estate_management/screens/varindo/form_pemesanan_jasa_screen.dart';
import 'package:varindo_estate_management/screens/varindo/ipl_screen.dart';
import 'package:varindo_estate_management/screens/varindo/live_cctv_screen.dart';
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
        path: "/phone-number-validation",
        name: "phone-number-validation",
        builder: (context, state) {
          return PhoneNumberValidationScreen();
        }
      ),
      GoRoute(
        path: "/select-property-list",
        name: "select-property-list",
        builder: (context, state) {
          return SelectPropertyListScreen();
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
            path: "ipl",
            name: "ipl",
            builder: (context, state) {
              return IplScreen();
            }
          ),
          GoRoute(
            path: "event-warga",
            name: "event-warga",
            builder: (context, index) {
              return EventWargaScreen();
            }
          ),
          GoRoute(
            path: "form-pemesanan-jasa",
            name: "form-pemesanan-jasa",
            builder: (context, state) {
              return FormPemesananJasaScreen();
            }
          ),
          GoRoute(
            path: "live-cctv",
            name: "live-cctv",
            builder: (context, state) {
              return LiveCctvScreen();
            }
          ),
          GoRoute(
            path: "darurat",
            name: "darurat",
            builder: (context, state) {
              return DaruratScreen();
            }
          )
        ]
      )
    ]
  );

  GoRouter get router => _router;
}