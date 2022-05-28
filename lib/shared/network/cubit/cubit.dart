import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/shared/network/cubit/states.dart';
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
    'Business News',
    'Sports News',
    'Science News',
  ];

  // List of Screens
  List<Widget> screens = const
  [
  ];

  // The List of BottomNavigationBar Items to move between Screens
  List<BottomNavigationBarItem> bottomNavItem = const
  [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business_sharp,
        ),
        label: 'Business'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  // Function To Change BottomNavigationBar Items by emit The State
  void changeBottomNavBar (int index)
  {
    emit(AppBottomNavigationBarState());
  }

  // Function to Get Business Data With API by using Dio
  List<dynamic> business = [];
  void getBusinessData()
  {
    emit(AppGetBusinessLoadingState());
    if(business.isEmpty)
    {
      DioHelper.get(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'business',
          'apiKey':'1f52d78ad5974c76986eb277605f552a',
        },
      ).then((value)
      {
        business = value.data['articles'];
        emit(AppGetBusinessSuccessState());
      }).catchError((error)
      {
        emit(AppGetBusinessErrorState(error.toString()));
      });
    }else
      {
        emit(AppGetBusinessSuccessState());
      }

  }

  // Function to Get Science Data With API
  List<dynamic> search = [];
  void getSearchData(String value)
  {
    emit(AppGetSearchLoadingState());
    DioHelper.get(
      url: 'v2/everything',
      query:
      {
        'q':value,
        'apiKey':'1f52d78ad5974c76986eb277605f552a',
      },
    ).then((value)
    {
      search = value.data['articles'];
      emit(AppGetSearchSuccessState());
    }).catchError((error)
    {
      emit(AppGetSearchErrorState(error.toString()));
    });
  }

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