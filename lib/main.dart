import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Features/Auth/Login/Screens/login_screen.dart';
import 'Features/Auth/profile/Controller/profile_view_cubit.dart';
import 'Features/main/Volunteer/cubit/volunteer_view_cubit.dart';
import 'Features/main/donor/cubit/home_view_cubit.dart';
import 'Features/main/home/feature/manager/home_cubite.dart';
import 'Features/main/layoutScreen.dart';
import 'Features/main/splash_screen.dart';
import 'core/sharde/blocObserver.dart';
import 'core/sharde/chacheHelper.dart';
import 'core/sharde/dioHelper.dart';
import 'core/sharde/widget/consts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  late Widget widget;
  DioHelper.init();
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');

  Onbording2 = CacheHelper.getData(key: 'onBording');
  if (Onbording2 != null) {
    if (uId != null) {
      widget = LayoutScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = SplashScreen();
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DonorViewCubit()
            ..getHomeData()
            ..getSharesData(),
        ),
        BlocProvider(
          create: (context) => HomeViewCubit()..getProfile(),
        ),
        BlocProvider(
          create: (context) => VolunteerViewCubit()..getVolunteerData(),
        ),
        BlocProvider(
          create: (context) => DonorViewCubit()..getCartAll(),
        ),
        BlocProvider(
          create: (context) => ProfileViewCubit()..getDataProfile(),
        )
      ],
      child: MyApp(
        StartWidget: widget,
      )));
}

class MyApp extends StatelessWidget {
  dynamic StartWidget;

  MyApp({super.key, required this.StartWidget});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar', ''),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', ''),
          ],
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: StartWidget,
        ));
  }
}
