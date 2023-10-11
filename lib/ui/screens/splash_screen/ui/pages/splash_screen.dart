import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/datasource/local/shared_preference_data.dart';
import '../../../../../core/di/service_locator.dart';
import '../../../../../core/router/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  double percent=10.0;

  void startLoading(){
    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds: 300),(_){
      setState(() {
        percent += 15;
        if (percent >= 100) {
          timer!.cancel();
          if (serviceLocator<PrefDataSource>().getAuthToken() == null ||
              serviceLocator<PrefDataSource>().getEventId() == 0) {
            Navigator.popAndPushNamed(context, Routes.welcomeScreen);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.welcomeScreen, (route) => false);
          }
        }
      });
    });
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    startLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: Image.asset(
            "assets/images/flash_screen_bg.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    ));
  }
}
