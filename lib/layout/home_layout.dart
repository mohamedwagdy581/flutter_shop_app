import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/shared/components/components.dart';
import 'package:flutter_shop_app/shared/network/cubit/cubit.dart';
import 'package:flutter_shop_app/shared/network/cubit/states.dart';

import '../modules/search/search_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) 
      {

        var cubit = AppCubit.get(context);


        return Scaffold(
        appBar: AppBar(
          title: Text(cubit.appBarTitle[cubit.currentIndex],),
          actions: 
          [
            IconButton(
              onPressed: ()
              {
                navigateTo(context, const SearchScreen(),);
              }, 
              icon:  const Icon(
                Icons.search,
                ),
                ),
          ],
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index)
          {
            cubit.changeBottomNavBar(cubit.currentIndex);
          },
          currentIndex: cubit.currentIndex,
          items: cubit.bottomNavItem,
        ),
    );
    },
    );
  }
}