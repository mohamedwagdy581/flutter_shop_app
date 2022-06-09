import 'package:flutter_shop_app/models/change_favorites_model.dart';
import 'package:flutter_shop_app/models/login_model.dart';

abstract class AppStates {}

// Initial State
class AppInitialState extends AppStates {}

// BottomNavigationBar State
class AppBottomNavigationBarState extends AppStates {}

// Get Home Data From API State
class AppGetHomeLoadingState extends AppStates {}

class AppGetHomeSuccessState extends AppStates {}

class AppGetHomeErrorState extends AppStates {
  final String error;

  AppGetHomeErrorState(this.error);
}

// Get Categories Data From API State
class AppGetCategoriesSuccessState extends AppStates {}

class AppGetCategoriesErrorState extends AppStates {
  final String error;

  AppGetCategoriesErrorState(this.error);
}

// Get Search Data From API State
class AppGetSearchLoadingState extends AppStates {}

class AppGetSearchSuccessState extends AppStates {}

class AppGetSearchErrorState extends AppStates {
  final String error;

  AppGetSearchErrorState(this.error);
}

// Change Mode Theme of App
class AppChangeModeThemeState extends AppStates {}

// Change Favorites States
class AppChangeFavoritesState extends AppStates {}

class AppChangeFavoritesSuccessState extends AppStates {
  final ChangeFavotitesModel model;

  AppChangeFavoritesSuccessState(this.model);
}

class AppChangeFavoritesErrorState extends AppStates {}

// Get Favorite from api
class AppGetFavoritesSuccessState extends AppStates {}

class AppGetFavoritesErrorState extends AppStates {}

// Get User Data From API State
class AppGetUserDataLoadingState extends AppStates {}

class AppGetUserDataSuccessState extends AppStates {
  final LoginModel? loginModel;

  AppGetUserDataSuccessState(this.loginModel);
}

class AppGetUserDataErrorState extends AppStates {
  final String error;

  AppGetUserDataErrorState(this.error);
}

// Get User Data From API State
class AppUpdateUserDataLoadingState extends AppStates {}

class AppUpdateUserDataSuccessState extends AppStates {
  final LoginModel? loginModel;

  AppUpdateUserDataSuccessState(this.loginModel);
}

class AppUpdateUserDataErrorState extends AppStates {
  final String error;

  AppUpdateUserDataErrorState(this.error);
}
