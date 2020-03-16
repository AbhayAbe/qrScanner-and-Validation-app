import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'mainScreen.dart';

class SplashScreencl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenBody();
}

class SplashScreenBody extends State<SplashScreencl> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // TODO: implement build
    return SplashScreen(
      seconds: 3,
      backgroundColor: Colors.black,
      loadingText: Text(
        "QR SCANNER",
        style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
      ),
      loaderColor: Colors.yellowAccent,
      image: Image.asset('assets/YourLogo.png'),
      photoSize: 150,
      navigateAfterSeconds: HomeScreen(),
    );
  }
}
