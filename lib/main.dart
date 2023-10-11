import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styra_poc/ui/screens/auth_screen/bloc/login_cubit.dart';
import 'package:styra_poc/ui/screens/splash_screen/ui/pages/splash_screen.dart';
import 'package:styra_poc/ui/theme/theme_const.dart';

import 'core/di/service_locator.dart';
import 'core/router/router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

final botToastBuilder = BotToastInit();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [

      BlocProvider(
        create: (context) => serviceLocator<LoginCubit>(),
      ),
    ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) =>
            MaterialApp(
                title: 'SalesApp',
                debugShowCheckedModeBanner: false,
                builder: (context, widget) {
                  widget = botToastBuilder(context, widget);
                  return widget;
                },
                navigatorObservers: [BotToastNavigatorObserver()],
                onGenerateRoute: (settings) => Routes.generateRoute(settings),
                theme: ThemeConst.lightThemeData,
                home: const SplashScreen()
            ),
      ),
    );
  }
}


