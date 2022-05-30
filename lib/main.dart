import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/layout/home_layout.dart';
import 'package:flutter_shop_app/shared/network/cubit/cubit.dart';
import 'package:flutter_shop_app/shared/network/cubit/states.dart';
import 'package:flutter_shop_app/shared/network/local/cache_helper.dart';
import 'package:flutter_shop_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_shop_app/shared/components/constants.dart';
import 'package:flutter_shop_app/shared/style/theme.dart';

import 'modules/login/login_screen.dart';
import 'modules/onboarding_screen.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.intit();

  bool isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');

  // ignore: unnecessary_null_comparison
  if(onBoarding != null) 
  {
    // ignore: unnecessary_null_comparison
    if(token != null)
    {
      widget = const HomeLayout();
    }else 
    {
      widget = LoginScreen();
    }
  }else 
  {
    widget = const OnBoardingScreen();
  }


  runApp(MyApp(isDark: isDark, startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  const MyApp({super.key, required this.isDark, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getHomeData()..getCategoriesModel(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {  },
        builder: (BuildContext context, AppStates state) 
        {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: startWidget,
        );
        },
      ),
    );
  }
}
