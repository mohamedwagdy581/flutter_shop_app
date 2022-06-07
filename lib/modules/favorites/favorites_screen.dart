import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/shared/style/colors.dart';

import '../../shared/network/cubit/cubit.dart';
import '../../shared/network/cubit/states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildFavProduct(),
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Divider(
              thickness: 2,
            ),
          ),
          itemCount: 15,
        );
      },
    );
  }

// New Widget to build Favorite Product UI
  Widget buildFavProduct() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 120.0,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/R.300756144ee94c0048440274a043e0ec?rik=f25T4LKGDOQzQQ&pid=ImgRaw&r=0'),
                    width: 100,
                    height: 100.0,
                  ),
                  if (1 != 0)
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '{model.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1.3,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Text(
                          '2000',
                          style: TextStyle(
                            color: defaultColor,
                            fontSize: 13.0,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        if (1 != 0)
                          const Text(
                            '5000',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            //print(model.id);
                          },
                          icon: const CircleAvatar(
                            radius: 14.0,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.favorite_border,
                              size: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
