import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:varindo_estate_management/app_router.dart';
import 'package:varindo_estate_management/locator.dart';
import 'package:varindo_estate_management/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    clearLocator();
    super.dispose();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'AQUANE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: HexColor.fromHex(kSecondaryColor), 
          primary: HexColor.fromHex(kPrimaryColor)
        ),
        useMaterial3: true,
      ),
      routerConfig: AppRouter().router,
      builder: (context, child) {
        // Retrieve the MediaQueryData from the current context.
        final mediaQueryData = MediaQuery.of(context);

        // Calculate the scaled text factor using the clamp function to ensure it stays within a specified range.
        final scale = mediaQueryData.textScaler.clamp(
          minScaleFactor: 1.0, // Minimum scale factor allowed.
          maxScaleFactor: 1.0, // Maximum scale factor allowed.
        );

        // return SafeArea(
        //   top: false,
        //   bottom: true,
        //   child: MediaQuery(
        //     data: mediaQueryData.copyWith(
        //       textScaler: scale,
        //     ),
        //     child: child!
        //   ),
        // );

        return MediaQuery(
          data: mediaQueryData.copyWith(
            textScaler: scale,
          ),
          child: child!
        );
      },
    );
  }
}
