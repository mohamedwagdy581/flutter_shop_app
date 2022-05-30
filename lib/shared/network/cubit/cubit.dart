import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/models/home_model.dart';
import 'package:flutter_shop_app/modules/categories/categories_screen.dart';
import 'package:flutter_shop_app/modules/favorites/favorites_screen.dart';
import 'package:flutter_shop_app/modules/products/products_screen.dart';
import 'package:flutter_shop_app/modules/settings/settings_screen.dart';
import 'package:flutter_shop_app/shared/components/constants.dart';
import 'package:flutter_shop_app/shared/network/cubit/states.dart';
import 'package:flutter_shop_app/shared/network/end_points.dart';
import '../local/cache_helper.dart';
import '../remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() :super(AppInitialState());

  // Get context to Easily use in a different places in all Project
  static AppCubit get(context)=> BlocProvider.of(context);
  //__________________

  int currentIndex = 0;

  // List of AppBar Titles
  List<String> appBarTitle = const
  [
    'Products',
    'Categories',
    'Favorites',
    'Settings',
  ];

  // List of Screens
  List<Widget> screens = const
  [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  // The List of BottomNavigationBar Items to move between Screens
  List<BottomNavigationBarItem> bottomNavItem = const
  [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.production_quantity_limits,
        ),
        label: 'Products'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.category_outlined,
      ),
      label: 'Categoties',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_outline_rounded,
      ),
      label: 'favorites',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings_sharp,
      ),
      label: 'Settings',
    ),
  ];

  // Function To Change BottomNavigationBar Items by emit The State
  void changeBottomNavBar (int index)
  {
    emit(AppBottomNavigationBarState());
  }

  // Function to Get Home Data with API by using Dio

  HomeModel? homeModel;
  void getHomeData()
  {
    emit(AppGetHomeLoadingState());
    DioHelper.getData(
      url: HOME,
      token: token,
      ).then((value) 
    {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel?.data?.banners[0].image);
      emit(AppGetHomeSuccessState());
    }).catchError((error)
    {
      emit(AppGetHomeErrorState(error));
    });
  }

  // // Function to Get Business Data With API by using Dio
  // List<dynamic> business = [];
  // void getBusinessData()
  // {
  //   emit(AppGetHomeLoadingState());
  //   if(business.isEmpty)
  //   {
  //     DioHelper.getData(
  //       url: 'v2/top-headlines',
  //       query:
  //       {
  //         'country':'eg',
  //         'category':'business',
  //         'apiKey':'1f52d78ad5974c76986eb277605f552a',
  //       },
  //     ).then((value)
  //     {
  //       business = value.data['articles'];
  //       emit(AppGetHomeSuccessState());
  //     }).catchError((error)
  //     {
  //       emit(AppGetHomeErrorState(error.toString()));
  //     });
  //   }else
  //     {
  //       emit(AppGetHomeSuccessState());
  //     }

  // }

  // // Function to Get Science Data With API
  // List<dynamic> search = [];
  // void getSearchData(String value)
  // {
  //   emit(AppGetSearchLoadingState());
  //   DioHelper.getData(
  //     url: 'v2/everything',
  //     query:
  //     {
  //       'q':value,
  //       'apiKey':'1f52d78ad5974c76986eb277605f552a',
  //     },
  //   ).then((value)
  //   {
  //     search = value.data['articles'];
  //     emit(AppGetSearchSuccessState());
  //   }).catchError((error)
  //   {
  //     emit(AppGetSearchErrorState(error.toString()));
  //   });
  // }

  // Function to Change Theme mode
  bool isDark = false;
  void changeAppModeTheme({bool? fromShared})
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeThemeState());
    }else
    {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value)
      {
        emit(AppChangeModeThemeState());
      });
    }
  }

}