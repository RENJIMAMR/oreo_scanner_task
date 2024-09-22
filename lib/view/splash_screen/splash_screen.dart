import 'package:flutter/material.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:oreo_scanner_task/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstants.splashpic), fit: BoxFit.cover)),
    ));
  }
}
