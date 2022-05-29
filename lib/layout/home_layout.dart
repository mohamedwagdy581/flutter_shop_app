import 'package:flutter/material.dart';
import 'package:flutter_shop_app/modules/login_screen/login_screen.dart';
import 'package:flutter_shop_app/shared/components/components.dart';
import 'package:flutter_shop_app/shared/network/local/cache_helper.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            'Home',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(
              height: 40.0,
            ), 

            defaultTextButton(
              onPressed: ()
              {
                CacheHelper.removeData(key: 'token').then((value) 
                {
                  if(value)
                  {
                    navigateAndFinish(context, LoginScreen());
                  }
                });
              }, 
              text: 'sign out',
            ),
        ],
      ),
    );
  }
}