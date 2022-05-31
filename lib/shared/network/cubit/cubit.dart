import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/models/categories_model.dart';
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

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  // Get context to Easily use in a different places in all Project
  static AppCubit get(context) => BlocProvider.of(context);
  //__________________

  int currentIndex = 0;

  // List of AppBar Titles
  List<String> appBarTitle = const [
    'Products',
    'Categories',
    'Favorites',
    'Settings',
  ];

  // List of Screens
  List<Widget> screens = const [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  // The List of BottomNavigationBar Items to move between Screens
  List<BottomNavigationBarItem> bottomNavItem = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.production_quantity_limits,
        ),
        label: 'Products'),
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
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavigationBarState());
  }

  // Function to Get Home Data with API by using Dio
  HomeModel? homeModel;
  Map<int, bool>? favorite = {};
  void getHomeData() {
    //emit(AppGetHomeLoadingState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data!.products.forEach((element)
      {
        favorite!.addAll(
            {
              element.id! : element.inFavorite!,
            });
      });
      emit(AppGetHomeSuccessState());
    }).catchError((error) {
      printFullText(error.toString());
      emit(AppGetHomeErrorState(error));
    });
  }

  // Function to Get Categories Data with API by using Dio
  CategoriesModel? categoriesModel;
  void getCategoriesModel() {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(AppGetCategoriesSuccessState());
    }).catchError((error) {
      emit(AppGetCategoriesErrorState(error));
    });
  }

  // Function to Change Theme mode
  bool isDark = false;
  void changeAppModeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeThemeState());
      });
    }
  }
}
