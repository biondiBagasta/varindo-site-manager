import "package:another_flutter_splash_screen/another_flutter_splash_screen.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class SplashScreen extends StatefulWidget {

  const SplashScreen({ super.key });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {

    return FlutterSplashScreen.fadeIn(
      useImmersiveMode: false,
      
      backgroundColor: Colors.white,
      childWidget: Center(
        child: Image.asset("assets/splash-screen.jpg", width: 512,)
      ),
      asyncNavigationCallback: () async {
        Future.delayed(const Duration(seconds: 3)).then((_) {
          if(context.mounted) {
            context.pushNamed("main");
          }
        });
      },
    );
  }
}